import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';
import 'package:week_19/features/details/data/models/movie_details_model.dart';

class ProductionCompaniesSection extends StatelessWidget {
  const ProductionCompaniesSection({super.key, required this.companies});

  final List<ProductionCompany> companies;

  @override
  Widget build(BuildContext context) {
    if (companies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Production Companies',
          style: AppTextStyles.font16Bold.copyWith(
            color: context.customAppColors.grey900,
          ),
        ),
        verticalSpace(12),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: companies.map((company) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: context.customAppColors.grey50,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: context.customAppColors.grey200,
                  width: 1.w,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.business_rounded,
                    size: 16.w,
                    color: context.customAppColors.primary800,
                  ),
                  horizontalSpace(6),
                  Text(
                    company.name ?? 'N/A',
                    style: AppTextStyles.font13Regular.copyWith(
                      color: context.customAppColors.grey900,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
