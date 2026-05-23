import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  void increment() {
    emit(CounterValue(state.value +1));
  }

  void decrement() {
   emit(CounterValue(state.value -1));
  }
}
