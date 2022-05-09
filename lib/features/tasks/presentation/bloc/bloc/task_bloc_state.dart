part of 'task_bloc.dart';

class TaskBlocState {
  const TaskBlocState();

  add(LoadTask loadTask) {}
}

class Taskloading extends TaskBlocState {}

class Taskloaded extends TaskBlocState {

  ///This is the updated list of the tasks
  final List<Todo> todos;

  const Taskloaded({this.todos = const <Todo>[]});
}
