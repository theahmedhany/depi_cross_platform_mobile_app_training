import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class TimeStatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isLarge;

  const TimeStatItem({
    super.key,
    required this.value,
    required this.label,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isLarge ? 48 : 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            height: 1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.textMedium),
        ),
      ],
    );
  }
}
