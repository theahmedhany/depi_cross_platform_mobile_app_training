import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';

class FocusSessionButton extends StatelessWidget {
  final String lastSessionTime;

  const FocusSessionButton({super.key, required this.lastSessionTime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeight + 16,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement focus session functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryCoral,
          foregroundColor: AppColors.textDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          ),
          elevation: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.startFocusSession,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 18,
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${AppStrings.lastSession.split(':')[0]}: $lastSessionTime',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textDark.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
