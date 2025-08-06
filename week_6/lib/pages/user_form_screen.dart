import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_text_form_field.dart';
import 'main_page.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        final user = User(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
        );

        _showSuccessDialog(user);
      }
    }
  }

  void _showSuccessDialog(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success!'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('User created successfully:'),
              const SizedBox(height: 16),
              Text('Name: ${user.name}'),
              Text('Email: ${user.email}'),
              Text('Phone: ${user.phone}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MainPage()),
                );
              },
              child: const Text('Continue to Home'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('User Registration'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: orientation == Orientation.portrait
                  ? _buildPortraitLayout()
                  : _buildLandscapeLayout(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        CustomCard(
          child: Column(
            children: [
              const ProfileImageWidget(size: 100),
              const SizedBox(height: 16),
              Text(
                'Create Your Profile',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Fill in your details below',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomCard(
          child: Column(
            children: [
              CustomTextFormField(
                label: 'Full Name',
                hint: 'Enter your full name',
                prefixIcon: Icons.person,
                controller: _nameController,
                validator: Validators.validateName,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'Email Address',
                hint: 'Enter your email address',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'Phone Number',
                hint: 'Enter your phone number',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                validator: Validators.validatePhone,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Create Account',
                onPressed: _submitForm,
                isLoading: _isLoading,
                icon: Icons.person_add,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: CustomCard(
            child: Column(
              children: [
                const ProfileImageWidget(size: 80),
                const SizedBox(height: 16),
                Text(
                  'Create Your Profile',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Fill in your details',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: CustomCard(
            child: Column(
              children: [
                CustomTextFormField(
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  prefixIcon: Icons.person,
                  controller: _nameController,
                  validator: Validators.validateName,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  label: 'Email Address',
                  hint: 'Enter your email address',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: Validators.validateEmail,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  label: 'Phone Number',
                  hint: 'Enter your phone number',
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  validator: Validators.validatePhone,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Create Account',
                  onPressed: _submitForm,
                  isLoading: _isLoading,
                  icon: Icons.person_add,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
