import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/models/task_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  addTask(String text) {
    TaskModel task = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
      isCompleted: false,
    );
    emit(UpdataTodoList([...state.todos, task]));
  }

  deleteTask(int id) {
    final List<TaskModel> newList = state.todos
        .where((task) => task.id != id)
        .toList();
    emit(UpdataTodoList(newList));
  }

  toggleTask(int id) {
    final List<TaskModel> newList = state.todos.map((task) {
      return task.id == id
          ? task.copyWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(UpdataTodoList(newList));
  }
}
