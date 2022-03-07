import 'package:equatable/equatable.dart';

class Todo {
  final double id;
  final String task;
  final String description;

  Todo({
    required this.id,
    required this.task,
    required this.description,
  });

  static List<Todo> todos = [
    // Todo(id: "1", task: "Todo1", description: "Todo 1 is available"),
    // Todo(id: "2", task: "Todo2", description: "Todo 2 is available"),
  ];
}
