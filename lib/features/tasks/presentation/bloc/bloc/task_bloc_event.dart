part of 'task_bloc.dart';

abstract class TaskBlocEvent {
  const TaskBlocEvent();

  // @override
  // List<Object> get props => [];
}

class LoadTask extends TaskBlocEvent {
  final List<Todo> todos;
  const LoadTask({this.todos = const <Todo>[]});
}

class AddTask extends TaskBlocEvent {

  ///This is the todo to add in to the todo list.
  final Todo todo;

  AddTask({required this.todo});
}

class DeleteTask extends TaskBlocEvent {
  final double todoId;
  DeleteTask({required this.todoId});
}
