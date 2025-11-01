import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import 'screen_time_chart.dart';
import 'time_stat_item.dart';

class ScreenTimeCard extends StatelessWidget {
  final String todayTime;
  final String lastHourTime;
  final int phonePickups;
  final String selectedDate;
  final List<double> chartData;

  const ScreenTimeCard({
    super.key,
    required this.todayTime,
    required this.lastHourTime,
    required this.phonePickups,
    required this.selectedDate,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.screenTime,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingMedium,
                  vertical: AppDimensions.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightBackground,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radiusSmall,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedDate,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: AppColors.textMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.paddingLarge),

          Row(
            children: [
              TimeStatItem(
                value: todayTime,
                label: AppStrings.today,
                isLarge: true,
              ),
              const SizedBox(width: AppDimensions.paddingXLarge),
              TimeStatItem(value: lastHourTime, label: AppStrings.lastHour),
              const SizedBox(width: AppDimensions.paddingXLarge),
              TimeStatItem(
                value: phonePickups.toString(),
                label: AppStrings.phonePickups,
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.paddingLarge),

          ScreenTimeChart(data: chartData),
        ],
      ),
    );
  }
}
