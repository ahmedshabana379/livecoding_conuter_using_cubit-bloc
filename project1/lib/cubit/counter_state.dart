part of 'counter_cubit.dart';

@immutable
sealed class CounterState {
  final int value;

  CounterState({required this.value});
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(value: 0);
}
final class CounterValue extends CounterState {
  CounterValue(int value) : super(value: value);
}
