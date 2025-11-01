import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class MovieInfoCard extends StatelessWidget {
  const MovieInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.customAppColors.grey50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.customAppColors.grey200, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: context.customAppColors.grey200.withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: context.customAppColors.primary800.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 24.w,
              color: context.customAppColors.primary800,
            ),
          ),
          verticalSpace(8),
          Text(
            label,
            style: AppTextStyles.font12Regular.copyWith(
              color: context.customAppColors.grey600,
            ),
          ),
          verticalSpace(4),
          Text(
            value,
            style: AppTextStyles.font14Bold.copyWith(
              color: context.customAppColors.grey900,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
