import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';
import '../widgets/common/common_widgets.dart';
import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_menu_item.dart';
import '../widgets/profile/profile_stats.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = '';
  String _userEmail = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName') ?? 'User';
      _userEmail = prefs.getString('userEmail') ?? 'user@example.com';
      _isLoading = false;
    });
  }

  Future<void> _logout() async {
    final bool? shouldLogout = await _showLogoutDialog();

    if (shouldLogout == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      if (mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppConstants.loginRoute, (route) => false);
      }
    }
  }

  Future<bool?> _showLogoutDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$feature feature coming soon')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () => _showComingSoon('Edit profile'),
          ),
        ],
      ),
      body: _isLoading
          ? const LoadingWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  ProfileHeader(userName: _userName, userEmail: _userEmail),
                  const SizedBox(height: 20),
                  const ProfileStats(),
                  const SizedBox(height: 20),
                  _buildProfileMenu(),
                ],
              ),
            ),
    );
  }

  Widget _buildProfileMenu() {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.person,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          onTap: () => _showComingSoon('Edit profile'),
        ),
        ProfileMenuItem(
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage your notification preferences',
          onTap: () => _showComingSoon('Notifications'),
        ),
        ProfileMenuItem(
          icon: Icons.privacy_tip,
          title: 'Privacy Settings',
          subtitle: 'Control your privacy and security',
          onTap: () => _showComingSoon('Privacy settings'),
        ),
        ProfileMenuItem(
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'Get help and contact support',
          onTap: () => _showComingSoon('Help & support'),
        ),
        ProfileMenuItem(
          icon: Icons.info,
          title: 'About',
          subtitle: 'App version and information',
          onTap: () => _showComingSoon('About'),
        ),
        ProfileMenuItem(
          icon: Icons.logout,
          title: 'Logout',
          subtitle: 'Sign out of your account',
          iconColor: Colors.red,
          onTap: _logout,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
