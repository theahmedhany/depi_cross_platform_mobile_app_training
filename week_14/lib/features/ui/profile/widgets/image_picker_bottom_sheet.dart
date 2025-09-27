import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  final Function(ImageSource) onImageSourceSelected;
  final VoidCallback? onRemoveImage;
  final bool showRemoveOption;

  const ImagePickerBottomSheet({
    super.key,
    required this.onImageSourceSelected,
    this.onRemoveImage,
    this.showRemoveOption = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(height: 24.h),

              Text(
                'Update Profile Picture',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                'Choose how you\'d like to update your profile picture',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              if (showRemoveOption)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _ImageSourceOption(
                            icon: Icons.camera_alt_rounded,
                            label: 'Camera',
                            onTap: () =>
                                onImageSourceSelected(ImageSource.camera),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: _ImageSourceOption(
                            icon: Icons.photo_library_rounded,
                            label: 'Gallery',
                            onTap: () =>
                                onImageSourceSelected(ImageSource.gallery),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    _ImageSourceOption(
                      icon: Icons.delete_outline_rounded,
                      label: 'Remove Picture',
                      onTap: onRemoveImage ?? () {},
                      color: Colors.red,
                      isDestructive: true,
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: _ImageSourceOption(
                        icon: Icons.camera_alt_rounded,
                        label: 'Camera',
                        onTap: () => onImageSourceSelected(ImageSource.camera),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: _ImageSourceOption(
                        icon: Icons.photo_library_rounded,
                        label: 'Gallery',
                        onTap: () => onImageSourceSelected(ImageSource.gallery),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageSourceOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final bool isDestructive;

  const _ImageSourceOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? Theme.of(context).colorScheme.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          onTap();
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          decoration: BoxDecoration(
            color: effectiveColor.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: effectiveColor.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      effectiveColor.withValues(alpha: 0.2),
                      effectiveColor.withValues(alpha: 0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 28.sp, color: effectiveColor),
              ),
              SizedBox(height: 12.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: effectiveColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
