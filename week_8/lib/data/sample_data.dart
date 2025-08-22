import '../constants/app_constants.dart';
import '../models/models.dart';

class SampleData {
  static List<Post> get samplePosts => [
    Post(
      id: 1,
      userId: 'user1',
      username: 'john_doe',
      userAvatar: AppConstants.defaultAvatarPath,
      content:
          'Just had an amazing coffee at the new café downtown! ☕️ #coffee #weekend',
      imageUrl: AppConstants.postImages[0],
      likes: 42,
      comments: 8,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isLiked: false,
    ),
    Post(
      id: 2,
      userId: 'user2',
      username: 'sarah_smith',
      userAvatar: AppConstants.defaultAvatarPath,
      content:
          'Beautiful sunset from my balcony tonight 🌅 Nature never fails to amaze me!',
      imageUrl: AppConstants.postImages[1],
      likes: 128,
      comments: 15,
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      isLiked: true,
    ),
    Post(
      id: 3,
      userId: 'user3',
      username: 'mike_johnson',
      userAvatar: AppConstants.defaultAvatarPath,
      content:
          'Finished my morning workout! 💪 Ready to tackle the day ahead. #fitness #motivation',
      imageUrl: null,
      likes: 35,
      comments: 5,
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      isLiked: false,
    ),
    Post(
      id: 4,
      userId: 'user4',
      username: 'emma_wilson',
      userAvatar: AppConstants.defaultAvatarPath,
      content:
          'Exploring the local art museum today. So many incredible pieces! 🎨 #art #culture',
      imageUrl: AppConstants.postImages[2],
      likes: 67,
      comments: 12,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      isLiked: true,
    ),
    Post(
      id: 5,
      userId: 'user5',
      username: 'alex_brown',
      userAvatar: AppConstants.defaultAvatarPath,
      content:
          'Homemade pizza night! 🍕 Nothing beats the satisfaction of making it from scratch.',
      imageUrl: AppConstants.postImages[3],
      likes: 89,
      comments: 20,
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      isLiked: false,
    ),
  ];
}
