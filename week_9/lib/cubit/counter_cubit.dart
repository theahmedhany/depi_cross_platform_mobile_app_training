import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterCubitState.initial());

  Future<void> increment() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final newValue = state.value + 1;
      final newHistory = List<int>.from(state.history)..add(newValue);

      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to increment counter: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> decrement() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final newValue = state.value - 1;
      final newHistory = List<int>.from(state.history)..add(newValue);

      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to decrement counter: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> reset() async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 200));

    try {
      final newHistory = List<int>.from(state.history)..add(0);

      emit(
        state
            .copyWith(
              value: 0,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to reset counter: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> incrementBy(int value) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 150));

    try {
      final newValue = state.value + value;
      final newHistory = List<int>.from(state.history)..add(newValue);

      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to increment counter by $value: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> decrementBy(int value) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 150));

    try {
      final newValue = state.value - value;
      final newHistory = List<int>.from(state.history)..add(newValue);

      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to decrement counter by $value: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> undo() async {
    if (!state.canUndo) return;

    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final newHistory = List<int>.from(state.history);
      newHistory.removeLast();
      final previousValue = newHistory.last;

      emit(
        state
            .copyWith(
              value: previousValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to undo: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> setValue(int value) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final newHistory = List<int>.from(state.history)..add(value);

      emit(
        state
            .copyWith(
              value: value,
              isLoading: false,
              lastUpdated: DateTime.now(),
              history: newHistory,
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: 'Failed to set counter value: ${e.toString()}',
        ),
      );
    }
  }

  void clearError() {
    emit(state.clearError());
  }
}
