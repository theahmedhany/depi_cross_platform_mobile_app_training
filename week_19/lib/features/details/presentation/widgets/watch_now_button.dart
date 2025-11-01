import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class WatchNowButton extends StatelessWidget {
  const WatchNowButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.customAppColors.primary800,
          foregroundColor: context.customAppColors.white,
          elevation: 4,
          shadowColor: context.customAppColors.primary800.withValues(
            alpha: 0.4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle_filled_rounded, size: 28.w),
            horizontalSpace(12),
            Text(
              'Watch Now',
              style: AppTextStyles.font18Bold.copyWith(
                color: context.customAppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
