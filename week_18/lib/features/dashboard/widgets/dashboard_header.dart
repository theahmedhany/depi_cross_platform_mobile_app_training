import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final String? avatarUrl;

  const DashboardHeader({super.key, required this.userName, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeBack,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textMedium),
            ),
            const SizedBox(height: 4),
            Text(userName, style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),

        Row(
          children: [
            Container(
              width: AppDimensions.avatarSize,
              height: AppDimensions.avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryPeach,
                image: avatarUrl != null
                    ? DecorationImage(
                        image: NetworkImage(avatarUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: avatarUrl == null
                  ? const Icon(
                      Icons.person,
                      color: AppColors.white,
                      size: AppDimensions.iconLarge,
                    )
                  : null,
            ),

            const SizedBox(width: AppDimensions.paddingSmall),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.tune),
              color: AppColors.textDark,
            ),
          ],
        ),
      ],
    );
  }
}
