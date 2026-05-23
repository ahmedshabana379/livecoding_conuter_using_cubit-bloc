import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/models/task_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTask>(_addTask);

    on<DeleteTask>(_deleteTask);

    on<CompeleteTask>(_compeleteTask);
  }




  FutureOr<void> _compeleteTask(event,emit){
     
   final List<TaskModel> newList = state.todos.map((task) {
    return task.id == event.id
        ? task.copyWith(isCompeletd: !task.isCompeletd)
        : task;
  }).toList();
  emit(UpdataTodoList(newList));
  }

  FutureOr<void> _deleteTask(event , emit){
        final List<TaskModel> newList = state.todos
      .where((task) => task.id != event.id)
      .toList();
  emit(UpdataTodoList(newList));
  }

  FutureOr<void> _addTask(event, emit) {
    TaskModel task = TaskModel(
    id: DateTime.now().millisecondsSinceEpoch,
    text: event.text,
    isCompeletd: false,
  );
  emit(UpdataTodoList([...state.todos, task]));
  }

}
