import 'package:flutter/material.dart';

class AppConstants {
  // App Info
  static const String appName = 'Dashboard Pro';
  static const String appVersion = '1.0.0';

  // API URLs (if needed)
  static const String baseUrl = 'https://api.example.com';

  // Storage Keys
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userTokenKey = 'userToken';
  static const String isDarkModeKey = 'isDarkMode';

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 300);
  static const Duration mediumAnimation = Duration(milliseconds: 500);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // Grid Items Data
  static const List<Map<String, dynamic>> gridItems = [
    {
      'title': 'Dashboard',
      'icon': Icons.dashboard_outlined,
      'color': Color(0xFF6C63FF),
      'route': '/dashboard',
      'category': 'Work',
    },
    {
      'title': 'Analytics',
      'icon': Icons.analytics_outlined,
      'color': Color(0xFF4CAF50),
      'route': '/analytics',
      'category': 'Work',
    },
    {
      'title': 'Reports',
      'icon': Icons.assessment_outlined,
      'color': Color(0xFFFF9800),
      'route': '/reports',
      'category': 'Important',
    },
    {
      'title': 'Settings',
      'icon': Icons.settings_outlined,
      'color': Color(0xFF9C27B0),
      'route': '/settings',
      'category': 'Personal',
    },
    {
      'title': 'Messages',
      'icon': Icons.message_outlined,
      'color': Color(0xFFF44336),
      'route': '/messages',
      'category': 'Urgent',
    },
    {
      'title': 'Calendar',
      'icon': Icons.calendar_today_outlined,
      'color': Color(0xFF00BCD4),
      'route': '/calendar',
      'category': 'Personal',
    },
    {
      'title': 'Tasks',
      'icon': Icons.task_outlined,
      'color': Color(0xFF795548),
      'route': '/tasks',
      'category': 'Work',
    },
    {
      'title': 'Profile',
      'icon': Icons.person_outline,
      'color': Color(0xFF607D8B),
      'route': '/profile',
      'category': 'Personal',
    },
  ];

  // Team Members Data
  static const List<Map<String, String>> teamMembers = [
    {
      'name': 'Ahmed Hassan',
      'position': 'Senior Flutter Developer',
      'image': '👨‍💻',
      'email': 'ahmed@company.com',
      'status': 'online',
    },
    {
      'name': 'Sarah Johnson',
      'position': 'UI/UX Designer',
      'image': '👩‍🎨',
      'email': 'sarah@company.com',
      'status': 'busy',
    },
    {
      'name': 'Mohamed Ali',
      'position': 'Project Manager',
      'image': '👨‍💼',
      'email': 'mohamed@company.com',
      'status': 'away',
    },
    {
      'name': 'Emily Chen',
      'position': 'Data Scientist',
      'image': '👩‍💻',
      'email': 'emily@company.com',
      'status': 'online',
    },
    {
      'name': 'David Rodriguez',
      'position': 'Backend Developer',
      'image': '👨‍💻',
      'email': 'david@company.com',
      'status': 'offline',
    },
  ];

  // Status Colors
  static const Map<String, Color> statusColors = {
    'online': Color(0xFF4CAF50),
    'busy': Color(0xFFFF9800),
    'away': Color(0xFFF44336),
    'offline': Color(0xFF9E9E9E),
  };
}
