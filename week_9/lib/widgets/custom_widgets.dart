import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/app_theme.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final bool isEnabled;
  final double? width;
  final double? height;

  const AnimatedButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    this.height,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isDisabled = !widget.isEnabled || widget.onPressed == null;

    return GestureDetector(
      onTapDown: isDisabled ? null : (_) => setState(() => _isPressed = true),
      onTapUp: isDisabled ? null : (_) => setState(() => _isPressed = false),
      onTapCancel: isDisabled ? null : () => setState(() => _isPressed = false),
      onTap: isDisabled ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: AppConstants.animationFast,
        width: widget.width ?? AppDimensions.buttonWidth,
        height: widget.height ?? AppDimensions.buttonHeight,
        decoration: BoxDecoration(
          gradient: isDisabled
              ? const LinearGradient(
                  colors: [AppColors.textTertiary, AppColors.textTertiary],
                )
              : widget.backgroundColor != null
              ? LinearGradient(
                  colors: [widget.backgroundColor!, widget.backgroundColor!],
                )
              : AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
          boxShadow: _isPressed || isDisabled
              ? []
              : [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMD),
            ),
            child: Center(
              child: widget.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.icon != null) ...[
                          Icon(
                            widget.icon,
                            color: widget.textColor ?? Colors.white,
                            size: AppDimensions.iconMD,
                          ),
                          const SizedBox(width: AppDimensions.spaceSM),
                        ],
                        Text(
                          widget.text,
                          style: AppTextStyles.buttonText.copyWith(
                            color: widget.textColor ?? Colors.white,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: AppConstants.animationMedium);
  }
}

class CounterDisplay extends StatelessWidget {
  final int value;
  final bool isLoading;
  final String? error;

  const CounterDisplay({
    super.key,
    required this.value,
    this.isLoading = false,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.spaceXL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLG),
        boxShadow: [
          BoxShadow(
            color: AppColors.border.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (error != null) ...[
            Container(
              padding: const EdgeInsets.all(AppDimensions.spaceMD),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                border: Border.all(color: AppColors.error.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: AppDimensions.iconMD,
                  ),
                  const SizedBox(width: AppDimensions.spaceSM),
                  Expanded(
                    child: Text(
                      error!,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn().shake(),
            const SizedBox(height: AppDimensions.spaceLG),
          ],
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                    value.toString(),
                    style: AppTextStyles.counterDisplay.copyWith(
                      color: _getValueColor(value),
                    ),
                  )
                  .animate(key: ValueKey(value))
                  .fadeIn(duration: AppConstants.animationFast)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1.0, 1.0),
                    duration: AppConstants.animationMedium,
                    curve: Curves.elasticOut,
                  ),
              if (isLoading)
                Positioned(
                  bottom: -10,
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.primary.withOpacity(0.7),
                      strokeWidth: 2,
                    ),
                  ).animate().fadeIn(),
                ),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceMD),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ValueIndicator(
                label: 'Status',
                value: _getStatusText(value),
                color: _getValueColor(value),
              ),
              const SizedBox(width: AppDimensions.spaceLG),
              _ValueIndicator(
                label: 'Absolute',
                value: value.abs().toString(),
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getValueColor(int value) {
    if (value > 0) return AppColors.success;
    if (value < 0) return AppColors.error;
    return AppColors.textSecondary;
  }

  String _getStatusText(int value) {
    if (value > 0) return 'Positive';
    if (value < 0) return 'Negative';
    return 'Zero';
  }
}

class _ValueIndicator extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ValueIndicator({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.bodySmall),
        const SizedBox(height: AppDimensions.spaceXS),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? elevation;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(AppDimensions.spaceMD),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.cardRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.border.withOpacity(0.3),
            blurRadius: elevation ?? AppDimensions.cardElevation,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppDimensions.spaceLG),
        child: child,
      ),
    ).animate().fadeIn().slideY(begin: 0.3, end: 0);
  }
}
