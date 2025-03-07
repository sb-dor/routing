import 'package:routing/todo_octopus_src/common/models/todo.dart';

final List<Todo> todos = List.generate(
  20,
  (index) => Todo(id: (index + 1).toString(), name: "Task ${index + 1}"),
);
