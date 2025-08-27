import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../screens/bloc_counter_screen.dart';
import '../screens/cubit_counter_screen.dart';
import '../utils/app_theme.dart';
import '../widgets/custom_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceLG,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: AppDimensions.spaceXL),

                  _AppHeader(),

                  const SizedBox(height: AppDimensions.spaceSM),

                  Column(
                    children: [
                      _FeatureCard(
                        title: 'BLoC Pattern',
                        subtitle: 'Business Logic Component',
                        description:
                            'Event-driven state management with clear separation of concerns',
                        icon: Icons.account_tree,
                        color: AppColors.primary,
                        features: const [
                          'Event-State Pattern',
                          'Reactive Programming',
                          'High Testability',
                          'Complex Logic Handling',
                        ],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BlocCounterScreen(),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppDimensions.spaceLG),

                      _FeatureCard(
                        title: 'Cubit Pattern',
                        subtitle: 'Simplified State Management',
                        description:
                            'Direct method calls for simpler state management scenarios',
                        icon: Icons.layers,
                        color: AppColors.secondary,
                        features: const [
                          'Method-based API',
                          'Simpler Implementation',
                          'History Tracking',
                          'Undo Functionality',
                        ],
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CubitCounterScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppDimensions.spaceLG),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calculate,
              size: AppDimensions.iconXL,
              color: Colors.white,
            ),
          ).animate().scale(
            duration: AppConstants.animationMedium,
            curve: Curves.elasticOut,
          ),

          const SizedBox(height: AppDimensions.spaceLG),

          Text(
            AppConstants.appName,
            style: AppTextStyles.headlineLarge,
            textAlign: TextAlign.center,
          ).animate().fadeIn().slideY(begin: -0.3, end: 0),

          const SizedBox(height: AppDimensions.spaceSM),

          Text(
            'Explore BLoC vs Cubit Patterns',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3, end: 0),

          const SizedBox(height: AppDimensions.spaceMD),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceMD,
              vertical: AppDimensions.spaceSM,
            ),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
              border: Border.all(color: AppColors.info.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: AppDimensions.iconSM,
                  color: AppColors.info,
                ),
                const SizedBox(width: AppDimensions.spaceXS),
                Text(
                  'Compare state management patterns',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.info,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms).scale(),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> features;
  final VoidCallback onTap;

  const _FeatureCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
    required this.features,
    required this.onTap,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: AppConstants.animationFast,
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          child: Container(
            padding: const EdgeInsets.all(AppDimensions.spaceLG),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
              border: Border.all(
                color: _isHovered
                    ? widget.color.withOpacity(0.3)
                    : AppColors.border,
                width: _isHovered ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? widget.color.withOpacity(0.2)
                      : AppColors.border.withOpacity(0.3),
                  blurRadius: _isHovered ? 12 : 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusMD,
                        ),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.color,
                        size: AppDimensions.iconLG,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spaceMD),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: AppTextStyles.headlineSmall,
                          ),
                          Text(
                            widget.subtitle,
                            style: AppTextStyles.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: widget.color,
                      size: AppDimensions.iconSM,
                    ),
                  ],
                ),

                const SizedBox(height: AppDimensions.spaceMD),

                Text(widget.description, style: AppTextStyles.bodyMedium),

                const SizedBox(height: AppDimensions.spaceMD),

                Wrap(
                  spacing: AppDimensions.spaceSM,
                  runSpacing: AppDimensions.spaceXS,
                  children: widget.features
                      .map(
                        (feature) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spaceSM,
                            vertical: AppDimensions.spaceXS,
                          ),
                          decoration: BoxDecoration(
                            color: widget.color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusXS,
                            ),
                            border: Border.all(
                              color: widget.color.withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            feature,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: widget.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn().slideX(begin: -0.3, end: 0);
  }
}
