import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C5CE7);
  static const Color primaryDark = Color(0xFF5F3DC4);
  static const Color primaryLight = Color(0xFF9775FA);

  static const Color accent = Color(0xFFFD79A8);
  static const Color accentSecondary = Color(0xFF74B9FF);

  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Colors.white;
  static const Color darkBackground = Color(0xFF1A1A2E);
  static const Color darkCard = Color(0xFF16213E);

  static const Color textPrimary = Color(0xFF2D3436);
  static const Color textSecondary = Color(0xFF636E72);
  static const Color textLight = Color(0xFFB2BEC3);

  static const List<Color> noteColors = [
    Color(0xFFFFE5E5),
    Color(0xFFE5F5FF),
    Color(0xFFFFE5F7),
    Color(0xFFE5FFE5),
    Color(0xFFFFF5E5),
    Color(0xFFF0E5FF),
    Color(0xFFFFE5E5),
    Color(0xFFE5FFFD),
  ];

  static const List<Color> noteAccentColors = [
    Color(0xFFFF6B9D),
    Color(0xFF4A90E2),
    Color(0xFFC44569),
    Color(0xFF26DE81),
    Color(0xFFFD9644),
    Color(0xFF7F8FF4),
    Color(0xFFFC5C65),
    Color(0xFF0FB9B1),
  ];

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFD79A8), Color(0xFFFF7675)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class AppDimensions {
  static const double borderRadius = 16.0;
  static const double cardElevation = 2.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double iconSize = 24.0;
  static const double fabSize = 64.0;
}

class AppAnimations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
}
