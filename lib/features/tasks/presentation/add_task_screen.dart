import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todotask_app/model/todo_model.dart';

import 'bloc/bloc/task_bloc.dart';

class AddNewTaask extends StatefulWidget {
  const AddNewTaask({Key? key}) : super(key: key);

  @override
  State<AddNewTaask> createState() => _AddNewTaaskState();
}

class _AddNewTaaskState extends State<AddNewTaask> {
  TextEditingController taskcontroller = TextEditingController();

  TextEditingController descontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    taskcontroller.text;
    descontroller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Set Your Tasks"),
        ),
        body: BlocListener<TaskBloc, TaskBlocState>(
            listener: (context, state) {
              if (state is Taskloaded) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Task is added")));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: taskcontroller,
                    decoration: const InputDecoration(
                      hintText: "Enter Task ",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: descontroller,
                    decoration: const InputDecoration(
                      hintText: "Enter description",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var todo = Todo(
                            id: DateTime.now().millisecond / 100,
                            task: taskcontroller.value.text,
                            description: descontroller.value.text);
                        context.read<TaskBloc>().add(
                              AddTask(todo: todo),
                            );
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Add Task",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            )));
  }
}
