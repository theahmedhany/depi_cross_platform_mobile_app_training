import 'package:flutter/material.dart';
import 'package:week_19/core/helpers/spacing.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class MovieDescriptionSection extends StatelessWidget {
  const MovieDescriptionSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Movie',
          style: AppTextStyles.font20Bold.copyWith(
            color: context.customAppColors.grey900,
          ),
        ),
        verticalSpace(12),
        Text(
          description,
          style: AppTextStyles.font14Regular.copyWith(
            color: context.customAppColors.grey700,
            height: 1.6,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
