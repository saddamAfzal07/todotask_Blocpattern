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
  final todos;
  AddTask({required this.todos});
}

class DeleteTask extends TaskBlocEvent {
  final todos;
  DeleteTask({required this.todos});
}
