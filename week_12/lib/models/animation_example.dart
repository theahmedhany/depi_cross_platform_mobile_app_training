import 'package:flutter/material.dart';

class AnimationExample {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Widget Function(BuildContext context) builder;

  const AnimationExample({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.builder,
  });
}
