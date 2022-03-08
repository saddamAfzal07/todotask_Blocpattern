import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todotask_app/model/todo_model.dart';

part 'task_bloc_event.dart';
part 'task_bloc_state.dart';




class TaskBloc extends Bloc<TaskBlocEvent, TaskBlocState> {
  TaskBloc() : super(Taskloading()) {
    on<LoadTask>(_onLoadTask);
    on<AddTask>(_onAddTask);
    on<DeleteTask>(_onDeleteTask);
  }
  void _onLoadTask(LoadTask event, Emitter<TaskBlocState> emit) {
    emit(
      Taskloaded(todos: event.todos),
    );
  }

  void _onAddTask(AddTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    if (state is Taskloaded) {

      final todoToAdd = event.todo;

      state.todos.add(todoToAdd);
      emit(Taskloaded(todos: state.todos));
    }
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    if (state is Taskloaded) {
      state.todos.removeWhere((element) => element.id == event.todoId);

      emit(Taskloaded(todos: state.todos));
    }
  }
}



