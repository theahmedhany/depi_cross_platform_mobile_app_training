abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}

class CounterReset extends CounterEvent {}

class CounterIncrementBy extends CounterEvent {
  final int value;

  CounterIncrementBy(this.value);
}

class CounterDecrementBy extends CounterEvent {
  final int value;

  CounterDecrementBy(this.value);
}
