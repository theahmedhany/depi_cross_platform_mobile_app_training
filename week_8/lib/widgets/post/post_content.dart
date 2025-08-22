import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  final String content;

  const PostContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(content, style: const TextStyle(fontSize: 16)),
    );
  }
}
