class CounterCubitState {
  final int value;
  final bool isLoading;
  final String? error;
  final DateTime lastUpdated;
  final List<int> history;

  const CounterCubitState({
    required this.value,
    this.isLoading = false,
    this.error,
    required this.lastUpdated,
    this.history = const [],
  });

  factory CounterCubitState.initial() {
    return CounterCubitState(
      value: 0,
      isLoading: false,
      lastUpdated: DateTime.now(),
      history: [0],
    );
  }

  CounterCubitState copyWith({
    int? value,
    bool? isLoading,
    String? error,
    DateTime? lastUpdated,
    List<int>? history,
  }) {
    return CounterCubitState(
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      history: history ?? this.history,
    );
  }

  CounterCubitState clearError() {
    return copyWith(error: null);
  }

  int get absoluteValue => value.abs();

  bool get isPositive => value > 0;

  bool get isNegative => value < 0;

  bool get isZero => value == 0;

  int get changeFromPrevious {
    if (history.length < 2) return 0;
    return value - history[history.length - 2];
  }

  bool get canUndo => history.length > 1;

  @override
  String toString() {
    return 'CounterCubitState(value: $value, isLoading: $isLoading, error: $error, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterCubitState &&
        other.value == value &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return value.hashCode ^
        isLoading.hashCode ^
        error.hashCode ^
        lastUpdated.hashCode;
  }
}
