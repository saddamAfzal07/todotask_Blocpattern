import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotask_app/features/tasks/presentation/add_task_screen.dart';
import 'package:todotask_app/features/tasks/presentation/bloc/bloc/task_bloc.dart';
import 'package:todotask_app/model/todo_model.dart';

import 'widgets/show_tasks_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Daily Diary"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => AddNewTaask()));
          },
          label: Row(
            children: const [
              Icon(Icons.upload),
              SizedBox(
                width: 3,
              ),
              Text("Add Tasks"),
            ],
          )),
      body: BlocBuilder<TaskBloc, TaskBlocState>(builder: (context, state) {
        if (state is Taskloading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is Taskloaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Your Tasks:",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ShowTasks(taskstate: state.todos),
              ],
            ),
          );
        } else {
          return Text("Something went wrong");
        }
      }),
    );
  }
}
