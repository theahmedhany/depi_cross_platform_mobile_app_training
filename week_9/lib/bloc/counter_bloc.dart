import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncrement>(_onIncrement);
    on<CounterDecrement>(_onDecrement);
    on<CounterReset>(_onReset);
    on<CounterIncrementBy>(_onIncrementBy);
    on<CounterDecrementBy>(_onDecrementBy);
  }

  Future<void> _onIncrement(
    CounterIncrement event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final newValue = state.value + 1;
      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
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

  Future<void> _onDecrement(
    CounterDecrement event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 100));

    try {
      final newValue = state.value - 1;
      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
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

  Future<void> _onReset(CounterReset event, Emitter<CounterState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 200));

    try {
      emit(
        state
            .copyWith(value: 0, isLoading: false, lastUpdated: DateTime.now())
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

  Future<void> _onIncrementBy(
    CounterIncrementBy event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 150));

    try {
      final newValue = state.value + event.value;
      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error:
              'Failed to increment counter by ${event.value}: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> _onDecrementBy(
    CounterDecrementBy event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(milliseconds: 150));

    try {
      final newValue = state.value - event.value;
      emit(
        state
            .copyWith(
              value: newValue,
              isLoading: false,
              lastUpdated: DateTime.now(),
            )
            .clearError(),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error:
              'Failed to decrement counter by ${event.value}: ${e.toString()}',
        ),
      );
    }
  }
}
