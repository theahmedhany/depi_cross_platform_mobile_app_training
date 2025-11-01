import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  final String label;
  final String value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.customAppColors.grey50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.customAppColors.grey200, width: 1.w),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20.w, color: context.customAppColors.primary800),
            horizontalSpace(12),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: context.customAppColors.grey600,
                  ),
                ),
                verticalSpace(4),
                Text(
                  value,
                  style: AppTextStyles.font14Regular.copyWith(
                    color: context.customAppColors.grey900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
