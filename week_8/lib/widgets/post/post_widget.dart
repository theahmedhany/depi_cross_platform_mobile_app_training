import 'package:flutter/material.dart';

import '../../models/models.dart';
import 'post_actions.dart';
import 'post_content.dart';
import 'post_header.dart';
import 'post_image.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  final VoidCallback onLike;

  const PostWidget({super.key, required this.post, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),
          PostContent(content: post.content),
          const SizedBox(height: 12),
          if (post.imageUrl != null) PostImage(imageUrl: post.imageUrl!),
          const SizedBox(height: 12),
          PostActions(post: post, onLike: onLike),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
