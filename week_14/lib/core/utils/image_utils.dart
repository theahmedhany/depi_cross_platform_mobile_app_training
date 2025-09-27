import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageUtils {
  static bool isBase64Url(String? url) {
    return url?.startsWith('base64://') == true;
  }

  static String extractUserIdFromBase64Url(String url) {
    return url.replaceFirst('base64://', '');
  }

  static Future<Uint8List?> getBase64ImageData(String userId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('user_images')
          .doc(userId)
          .get();

      if (doc.exists && doc.data() != null) {
        final imageData = doc.data()!['image_data'] as String?;
        if (imageData != null) {
          return base64Decode(imageData);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Widget buildProfileImage({
    required String? imageUrl,
    required double size,
    Widget? placeholder,
  }) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return placeholder ?? _defaultAvatar(size);
    }

    if (isBase64Url(imageUrl)) {
      final userId = extractUserIdFromBase64Url(imageUrl);
      return FutureBuilder<Uint8List?>(
        future: getBase64ImageData(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: size,
              height: size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            return Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: MemoryImage(snapshot.data!),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }

          return placeholder ?? _defaultAvatar(size);
        },
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  static Widget _defaultAvatar(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: Icon(Icons.person, size: size * 0.6, color: Colors.white),
    );
  }
}
