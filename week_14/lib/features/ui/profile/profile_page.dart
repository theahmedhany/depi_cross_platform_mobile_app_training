import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:week_14/features/ui/profile/widgets/action_buttons.dart';
import 'package:week_14/features/ui/profile/widgets/image_picker_bottom_sheet.dart';
import 'package:week_14/features/ui/profile/widgets/profile_app_bar.dart';
import 'package:week_14/features/ui/profile/widgets/profile_form.dart';
import 'package:week_14/features/ui/profile/widgets/profile_picture.dart';

import '../../cubits/profile/profile_cubit.dart';
import '../../cubits/profile/profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  XFile? _selectedImage;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _showImagePickerDialog() {
    final currentState = context.read<ProfileCubit>().state;
    final hasCurrentImage =
        currentState is ProfileLoaded &&
        currentState.profile?['profilePicture'] != null;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ImagePickerBottomSheet(
        onImageSourceSelected: _pickImage,
        onRemoveImage: hasCurrentImage || _selectedImage != null
            ? _removeImage
            : null,
        showRemoveOption: hasCurrentImage || _selectedImage != null,
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = pickedFile;
          _hasChanges = true;
        });

        _showSuccessSnackBar('Image selected successfully!');
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Failed to pick image: ${e.toString()}');
      }
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
      _hasChanges = true;
    });
    _showInfoSnackBar('Profile picture will be removed when you save');
  }

  void _onFormChanged() {
    if (!_hasChanges) {
      setState(() {
        _hasChanges = true;
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      context.read<ProfileCubit>().updateProfile(
        name: _nameController.text.trim(),
        bio: _bioController.text.trim(),
        image: _selectedImage,
      );
    }
  }

  void _showSuccessSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: Colors.white),
            SizedBox(width: 8.w),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(16.w),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_rounded, color: Colors.white),
            SizedBox(width: 8.w),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(16.w),
      ),
    );
  }

  void _showInfoSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info_rounded, color: Colors.blue[100]),
            SizedBox(width: 8.w),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(16.w),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const ProfileAppBar(),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailure) {
            _showErrorSnackBar(state.error);
          }

          if (state is ProfileLoaded) {
            _nameController.text = state.profile?['name'] ?? '';
            _bioController.text = state.profile?['bio'] ?? '';
            setState(() {
              _hasChanges = false;
              _selectedImage = null;
            });

            if (state.profile != null && state.profile!.isNotEmpty) {
              _showSuccessSnackBar('Profile updated successfully!');
            }
          }
        },
        builder: (context, state) {
          String? currentImageUrl;
          if (state is ProfileLoaded) {
            currentImageUrl = state.profile?['profilePicture'] as String?;
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.h),

                ProfilePicture(
                  selectedImage: _selectedImage,
                  currentImageUrl: currentImageUrl,
                  onImageTap: _showImagePickerDialog,
                ),

                SizedBox(height: 32.h),

                ProfileForm(
                  nameController: _nameController,
                  bioController: _bioController,
                  onChanged: _onFormChanged,
                  formKey: _formKey,
                ),

                SizedBox(height: 32.h),

                ActionButtons(
                  isLoading: state is ProfileLoading,
                  hasChanges: _hasChanges,
                  onSave: _saveProfile,
                  onViewCommunity: () =>
                      Navigator.pushReplacementNamed(context, '/users'),
                  hasImage: _selectedImage != null,
                ),

                SizedBox(height: 24.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
