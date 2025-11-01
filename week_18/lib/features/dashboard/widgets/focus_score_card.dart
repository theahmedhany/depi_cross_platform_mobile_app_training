import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';

class FocusScoreCard extends StatelessWidget {
  final double score;
  final String status;
  final int improvementPercentage;
  final List<String> mostUsedApps;

  const FocusScoreCard({
    super.key,
    required this.score,
    required this.status,
    required this.improvementPercentage,
    required this.mostUsedApps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.focusCardBackground,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.focusScore,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: AppDimensions.paddingLarge),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        score.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Icon(
                          Icons.arrow_upward,
                          color: AppColors.goodStatus,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMedium,
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(children: _buildAppIcons()),
                  const SizedBox(height: 4),
                  Text(
                    AppStrings.mostUsed,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.paddingLarge),

          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.celebration_outlined,
                  size: AppDimensions.iconSmall,
                  color: AppColors.textMedium,
                ),
                const SizedBox(width: AppDimensions.paddingSmall),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textDark,
                      ),
                      children: [
                        TextSpan(text: AppStrings.wayToGo),
                        const TextSpan(text: '\n'),
                        TextSpan(text: AppStrings.isLessThanLastWeek),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAppIcons() {
    final appIcons = [
      Icons.message,
      Icons.chat_bubble,
      Icons.photo_camera,
      Icons.play_circle,
      Icons.forum,
    ];

    return List.generate(
      appIcons.length.clamp(0, 5),
      (index) => Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.focusCardBackground, width: 2),
          ),
          child: Icon(appIcons[index], size: 16, color: AppColors.primaryCoral),
        ),
      ),
    );
  }
}
