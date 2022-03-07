import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotask_app/features/tasks/presentation/bloc/bloc/task_bloc.dart';
import 'package:todotask_app/model/todo_model.dart';

import 'features/tasks/presentation/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => TaskBloc()
                ..add(LoadTask(todos: [
                  Todo(
                      id: DateTime.now().millisecond / 100,
                      task: "Meeting at 5 pm",
                      description: "Task is available"),
                  // Todo(
                  //     id: "2",
                  //     task: "Task",
                  //     description: "Todo 2 is available"),
                ])))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TasksScreen(),
        ));
  }
}
