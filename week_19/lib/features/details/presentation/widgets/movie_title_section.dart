import 'package:flutter/material.dart';
import 'package:week_19/core/theme/app_texts/app_text_styles.dart';
import 'package:week_19/core/theme/theme_manager/theme_extensions.dart';

class MovieTitleSection extends StatelessWidget {
  const MovieTitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.font32Bold.copyWith(
        color: context.customAppColors.grey900,
        height: 1.2,
      ),
    );
  }
}
