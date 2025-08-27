class CounterState {
  final int value;
  final bool isLoading;
  final String? error;
  final DateTime lastUpdated;

  const CounterState({
    required this.value,
    this.isLoading = false,
    this.error,
    required this.lastUpdated,
  });

  factory CounterState.initial() {
    return CounterState(
      value: 0,
      isLoading: false,
      lastUpdated: DateTime.now(),
    );
  }

  CounterState copyWith({
    int? value,
    bool? isLoading,
    String? error,
    DateTime? lastUpdated,
  }) {
    return CounterState(
      value: value ?? this.value,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  CounterState clearError() {
    return copyWith(error: null);
  }

  int get absoluteValue => value.abs();

  bool get isPositive => value > 0;

  bool get isNegative => value < 0;

  bool get isZero => value == 0;

  @override
  String toString() {
    return 'CounterState(value: $value, isLoading: $isLoading, error: $error, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState &&
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
