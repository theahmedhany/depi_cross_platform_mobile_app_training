import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../widgets/app_logo.dart';
import '../widgets/focus_words_background.dart';
import '../widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _navigateToDashboard(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryCoral,
      body: SafeArea(
        child: Stack(
          children: [
            const FocusWordsBackground(),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryCoral.withOpacity(0.3),
                    AppColors.primaryCoral.withOpacity(0.6),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingLarge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: AppDimensions.paddingXLarge),

                  const Expanded(child: Center(child: AppLogo())),

                  GetStartedButton(
                    onPressed: () => _navigateToDashboard(context),
                  ),

                  const SizedBox(height: AppDimensions.paddingLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
