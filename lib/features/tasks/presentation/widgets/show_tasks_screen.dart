import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotask_app/features/tasks/presentation/bloc/bloc/task_bloc.dart';
import 'package:todotask_app/model/todo_model.dart';

class ShowTasks extends StatefulWidget {
  final List<Todo> taskstate;
  const ShowTasks({Key? key, required this.taskstate}) : super(key: key);

  @override
  State<ShowTasks> createState() => _ShowTasksState();
}

class _ShowTasksState extends State<ShowTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.taskstate.length,
      itemBuilder: (BuildContext context, int index) {

        final currentTodo = widget.taskstate[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTodo.task,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add_task)),
                    IconButton(
                        onPressed: () {
                          context
                              .read<TaskBloc>()
                              .add(DeleteTask(todoId: currentTodo.id));
                        },
                        icon: const Icon(Icons.cancel)),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
