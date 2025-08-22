import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../models/models.dart';

class PostActions extends StatelessWidget {
  final Post post;
  final VoidCallback onLike;

  const PostActions({super.key, required this.post, required this.onLike});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildLikeButton(),
          const SizedBox(width: 4),
          _buildLikeCount(),
          const SizedBox(width: 16),
          _buildCommentButton(context),
          const SizedBox(width: 4),
          _buildCommentCount(),
          const Spacer(),
          _buildShareButton(context),
        ],
      ),
    );
  }

  Widget _buildLikeButton() {
    return IconButton(
      onPressed: onLike,
      icon: Icon(
        post.isLiked ? Icons.favorite : Icons.favorite_border,
        color: post.isLiked ? Colors.red : Colors.grey[600],
      ),
    );
  }

  Widget _buildLikeCount() {
    return Text(
      '${post.likes}',
      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
    );
  }

  Widget _buildCommentButton(BuildContext context) {
    return IconButton(
      onPressed: () =>
          _showComingSoon(context, AppConstants.commentsComingSoonMessage),
      icon: Icon(Icons.comment_outlined, color: Colors.grey[600]),
    );
  }

  Widget _buildCommentCount() {
    return Text(
      '${post.comments}',
      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
    );
  }

  Widget _buildShareButton(BuildContext context) {
    return IconButton(
      onPressed: () =>
          _showComingSoon(context, AppConstants.shareComingSoonMessage),
      icon: Icon(Icons.share_outlined, color: Colors.grey[600]),
    );
  }

  void _showComingSoon(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
