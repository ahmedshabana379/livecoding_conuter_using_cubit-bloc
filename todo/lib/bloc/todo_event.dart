part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddTask extends TodoEvent{
  final String text;

  AddTask(this.text);
} 
class DeleteTask extends TodoEvent{
  final int id;

  DeleteTask(this.id);
} 
class CompeleteTask extends TodoEvent{

  final int id;

  CompeleteTask(this.id);
} 
