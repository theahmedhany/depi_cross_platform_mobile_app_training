import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../cubit/counter_cubit_state.dart';
import '../utils/app_theme.dart';
import '../widgets/custom_widgets.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Cubit Counter', style: AppTextStyles.headlineSmall),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          BlocBuilder<CounterCubit, CounterCubitState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.info_outline, color: AppColors.primary),
                onPressed: () => _showInfoDialog(context, state),
              );
            },
          ),
        ],
      ),
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
                  BlocBuilder<CounterCubit, CounterCubitState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          const SizedBox(height: AppDimensions.spaceMD),
                          CounterDisplay(
                            value: state.value,
                            isLoading: state.isLoading,
                            error: state.error,
                          ),

                          const SizedBox(height: AppDimensions.spaceMD),

                          _HistoryDisplay(state: state),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: AppDimensions.spaceLG),

                  BlocBuilder<CounterCubit, CounterCubitState>(
                    builder: (context, state) {
                      final cubit = context.read<CounterCubit>();
                      return _ControlButtons(state: state, cubit: cubit);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, CounterCubitState state) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cubit State Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _InfoRow('Current Value:', state.value.toString()),
            _InfoRow('Is Loading:', state.isLoading.toString()),
            _InfoRow('Has Error:', (state.error != null).toString()),
            _InfoRow('Last Updated:', _formatDateTime(state.lastUpdated)),
            _InfoRow('Is Positive:', state.isPositive.toString()),
            _InfoRow('Is Negative:', state.isNegative.toString()),
            _InfoRow('Is Zero:', state.isZero.toString()),
            _InfoRow('Absolute Value:', state.absoluteValue.toString()),
            _InfoRow('History Length:', state.history.length.toString()),
            _InfoRow('Can Undo:', state.canUndo.toString()),
            _InfoRow(
              'Change from Previous:',
              state.changeFromPrevious.toString(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:'
        '${dateTime.minute.toString().padLeft(2, '0')}:'
        '${dateTime.second.toString().padLeft(2, '0')}';
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Text(value, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}

class _HistoryDisplay extends StatelessWidget {
  final CounterCubitState state;

  const _HistoryDisplay({required this.state});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.history,
                color: AppColors.primary,
                size: AppDimensions.iconMD,
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Text(
                'History & Stats',
                style: AppTextStyles.headlineSmall.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceMD),

          Row(
            children: [
              Expanded(
                child: _StatItem(
                  label: 'Operations',
                  value: (state.history.length - 1).toString(),
                  icon: Icons.calculate,
                ),
              ),
              Expanded(
                child: _StatItem(
                  label: 'Last Change',
                  value: state.changeFromPrevious.toString(),
                  icon: Icons.trending_up,
                  color: state.changeFromPrevious > 0
                      ? AppColors.success
                      : state.changeFromPrevious < 0
                      ? AppColors.error
                      : AppColors.textSecondary,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.spaceMD),

          Text('Recent Values:', style: AppTextStyles.bodySmall),
          const SizedBox(height: AppDimensions.spaceXS),

          SizedBox(
            height: 80,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.spaceSM),
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSM),
                border: Border.all(color: AppColors.border),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: state.history.reversed
                      .take(10)
                      .map(
                        (value) => Container(
                          margin: const EdgeInsets.only(
                            right: AppDimensions.spaceXS,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spaceSM,
                            vertical: AppDimensions.spaceXS,
                          ),
                          decoration: BoxDecoration(
                            color: value == state.value
                                ? AppColors.primary
                                : AppColors.surface,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.radiusXS,
                            ),
                            border: Border.all(
                              color: value == state.value
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                          ),
                          child: Text(
                            value.toString(),
                            style: AppTextStyles.bodySmall.copyWith(
                              color: value == state.value
                                  ? Colors.white
                                  : AppColors.textSecondary,
                              fontWeight: value == state.value
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppDimensions.iconSM,
          color: color ?? AppColors.primary,
        ),
        const SizedBox(width: AppDimensions.spaceXS),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles.bodySmall),
            Text(
              value,
              style: AppTextStyles.bodyMedium.copyWith(
                color: color ?? AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ControlButtons extends StatelessWidget {
  final CounterCubitState state;
  final CounterCubit cubit;

  const _ControlButtons({required this.state, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AnimatedButton(
                  text: 'Decrement',
                  icon: Icons.remove,
                  onPressed: state.isLoading ? null : () => cubit.decrement(),
                  backgroundColor: AppColors.error,
                  isEnabled: !state.isLoading,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceMD),
              Expanded(
                child: AnimatedButton(
                  text: 'Increment',
                  icon: Icons.add,
                  onPressed: state.isLoading ? null : () => cubit.increment(),
                  isEnabled: !state.isLoading,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.spaceMD),

          Row(
            children: [
              Expanded(
                child: AnimatedButton(
                  text: '-5',
                  onPressed: state.isLoading
                      ? null
                      : () => cubit.decrementBy(5),
                  backgroundColor: AppColors.warning,
                  isEnabled: !state.isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Expanded(
                child: AnimatedButton(
                  text: 'Reset',
                  icon: Icons.refresh,
                  onPressed: state.isLoading ? null : () => cubit.reset(),
                  backgroundColor: AppColors.textSecondary,
                  isEnabled: !state.isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Expanded(
                child: AnimatedButton(
                  text: '+5',
                  onPressed: state.isLoading
                      ? null
                      : () => cubit.incrementBy(5),
                  backgroundColor: AppColors.success,
                  isEnabled: !state.isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDimensions.spaceMD),

          Row(
            children: [
              Expanded(
                child: AnimatedButton(
                  text: 'Undo',
                  icon: Icons.undo,
                  onPressed: (state.isLoading || !state.canUndo)
                      ? null
                      : () => cubit.undo(),
                  backgroundColor: AppColors.info,
                  isEnabled: !state.isLoading && state.canUndo,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Expanded(
                child: AnimatedButton(
                  text: 'Set to 100',
                  onPressed: state.isLoading ? null : () => cubit.setValue(100),
                  backgroundColor: AppColors.secondary,
                  isEnabled: !state.isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().slideY(begin: 0.5, end: 0).fadeIn();
  }
}
