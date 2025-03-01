import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/todo_octopus_src/feature/todo/controller/todo_controller.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({
    super.key,
    required this.todoId,
  });

  final String todoId;

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  late final TodoController _todoController;

  @override
  void initState() {
    super.initState();
    _todoController = context.read<TodoController>();
    _todoController.fetchTodo(widget.todoId);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _todoController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: SizedBox.shrink(),
            title: Text(_todoController.todo?.name ?? '-'),
          ),
        );
      },
    );
  }
}
