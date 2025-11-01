import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class MovieGenreBadge extends StatelessWidget {
  const MovieGenreBadge({super.key, required this.genre, this.icon});

  final String genre;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: context.customAppColors.primary800.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: context.customAppColors.primary800.withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.movie_filter_outlined,
            size: 16.w,
            color: context.customAppColors.primary800,
          ),
          horizontalSpace(6),
          Text(
            genre,
            style: AppTextStyles.font13Bold.copyWith(
              color: context.customAppColors.primary800,
            ),
          ),
        ],
      ),
    );
  }
}
