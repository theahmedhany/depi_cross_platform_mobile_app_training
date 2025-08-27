import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';
import '../utils/app_theme.dart';
import '../widgets/custom_widgets.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('BLoC Counter', style: AppTextStyles.headlineSmall),
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          BlocBuilder<CounterBloc, CounterState>(
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
            padding: const EdgeInsets.all(AppDimensions.spaceLG),
            child: Column(
              children: [
                CustomCard(
                  child: Column(
                    children: [
                      Text(
                        'BLoC Pattern Demo',
                        style: AppTextStyles.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppDimensions.spaceSM),
                      Text(
                        'Events → BLoC → States',
                        style: AppTextStyles.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppDimensions.spaceLG),

                Expanded(
                  child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      return CounterDisplay(
                        value: state.value,
                        isLoading: state.isLoading,
                        error: state.error,
                      );
                    },
                  ),
                ),

                const SizedBox(height: AppDimensions.spaceLG),

                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return _ControlButtons(
                      isLoading: state.isLoading,
                      onIncrement: () =>
                          context.read<CounterBloc>().add(CounterIncrement()),
                      onDecrement: () =>
                          context.read<CounterBloc>().add(CounterDecrement()),
                      onReset: () =>
                          context.read<CounterBloc>().add(CounterReset()),
                      onIncrementBy: (value) => context.read<CounterBloc>().add(
                        CounterIncrementBy(value),
                      ),
                      onDecrementBy: (value) => context.read<CounterBloc>().add(
                        CounterDecrementBy(value),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context, CounterState state) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('BLoC State Info'),
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

class _ControlButtons extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;
  final Function(int) onIncrementBy;
  final Function(int) onDecrementBy;

  const _ControlButtons({
    required this.isLoading,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
    required this.onIncrementBy,
    required this.onDecrementBy,
  });

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
                  onPressed: isLoading ? null : onDecrement,
                  backgroundColor: AppColors.error,
                  isEnabled: !isLoading,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceMD),
              Expanded(
                child: AnimatedButton(
                  text: 'Increment',
                  icon: Icons.add,
                  onPressed: isLoading ? null : onIncrement,
                  isEnabled: !isLoading,
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
                  onPressed: isLoading ? null : () => onDecrementBy(5),
                  backgroundColor: AppColors.warning,
                  isEnabled: !isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Expanded(
                child: AnimatedButton(
                  text: 'Reset',
                  icon: Icons.refresh,
                  onPressed: isLoading ? null : onReset,
                  backgroundColor: AppColors.textSecondary,
                  isEnabled: !isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Expanded(
                child: AnimatedButton(
                  text: '+5',
                  onPressed: isLoading ? null : () => onIncrementBy(5),
                  backgroundColor: AppColors.success,
                  isEnabled: !isLoading,
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
                  text: '-10',
                  onPressed: isLoading ? null : () => onDecrementBy(10),
                  backgroundColor: AppColors.error.withOpacity(0.8),
                  isEnabled: !isLoading,
                  height: AppDimensions.buttonHeightSM,
                ),
              ),
              const SizedBox(width: AppDimensions.spaceSM),
              Expanded(
                child: AnimatedButton(
                  text: '+10',
                  onPressed: isLoading ? null : () => onIncrementBy(10),
                  backgroundColor: AppColors.success.withOpacity(0.8),
                  isEnabled: !isLoading,
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
