import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class MovieRatingBadge extends StatelessWidget {
  const MovieRatingBadge({super.key, required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: context.customAppColors.primary800.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.star_rounded,
            size: 18.w,
            color: context.customAppColors.white,
          ),
          horizontalSpace(4),
          Text(
            rating,
            style: AppTextStyles.font14Bold.copyWith(
              color: context.customAppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
