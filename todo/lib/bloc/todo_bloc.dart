import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/models/task_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTask>(_addTask);

    on<DeleteTask>(_deleteTask);

    on<CompeleteTask>(_compeleteTask);
  }

  FutureOr<void> _compeleteTask(event, emit) {
    final List<TaskModel> newList = state.todos.map((task) {
      return task.id == event.id
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(UpdataTodoList(newList));
  }

  FutureOr<void> _deleteTask(event, emit) {
    final List<TaskModel> newList = state.todos
        .where((task) => task.id != event.id)
        .toList();
    emit(UpdataTodoList(newList));
  }

  FutureOr<void> _addTask(event, emit) {
    TaskModel task = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch,
      text: event.text,
      isCompleted: false,
    );
    emit(UpdataTodoList([...state.todos, task]));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return UpdataTodoList(
      (json['todos'] as List)
          .map((todo) => TaskModel.fromJson(todo as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return {"todos": state.todos.map((todo) => todo.toJson()).toList()};
  }
}
