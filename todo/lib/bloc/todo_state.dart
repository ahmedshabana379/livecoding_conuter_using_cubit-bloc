part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  final List<TaskModel> todos;

  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  TodoInitial() : super([]);
}

class UpdataTodoList extends TodoState {
  const UpdataTodoList(super.todos);
}
