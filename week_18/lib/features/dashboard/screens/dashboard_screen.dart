import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/focus_score_card.dart';
import '../widgets/focus_session_button.dart';
import '../widgets/screen_time_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(userName: 'Celeste', avatarUrl: null),

                const SizedBox(height: AppDimensions.paddingLarge),

                const ScreenTimeCard(
                  todayTime: '2:41',
                  lastHourTime: '0:12',
                  phonePickups: 23,
                  selectedDate: 'Thu, June 20',
                  chartData: [0.3, 0.5, 0.4, 0.6, 0.5, 0.7, 0.8],
                ),

                const SizedBox(height: AppDimensions.paddingMedium),

                const FocusScoreCard(
                  score: 8.5,
                  status: 'Good',
                  improvementPercentage: 7,
                  mostUsedApps: [
                    'assets/icons/messages.png',
                    'assets/icons/whatsapp.png',
                    'assets/icons/instagram.png',
                    'assets/icons/youtube.png',
                    'assets/icons/reddit.png',
                  ],
                ),

                const SizedBox(height: AppDimensions.paddingLarge),

                const FocusSessionButton(lastSessionTime: '2 hours ago'),

                const SizedBox(height: AppDimensions.paddingLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
