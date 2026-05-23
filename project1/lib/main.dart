import 'package:flutter/material.dart';
import 'package:project1/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Text('You have pushed the button this many times:'),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.value.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'decrement',
                  onPressed: context.read<CounterCubit>().decrement,
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: context.read<CounterCubit>().increment,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
