import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:routing/todo_octopus_src/feature/init/logic/provider_factories.dart';
import 'package:routing/todo_octopus_src/feature/todo/controller/todo_controller.dart';
import 'package:routing/todo_octopus_src/feature/todo/controller/todo_text_state_controller.dart';

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
  late final TodoTextStateController _textStateController;
  final TextEditingController _todoTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textStateController = TodoTextStateController(controller: _todoTextController);
    _todoController = todoController();
    _todoController.fetchTodo(widget.todoId);
  }

  @override
  void dispose() {
    _textStateController.dispose();
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _todoController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            leading: SizedBox.shrink(),
            leadingWidth: 0.0,
            title: Text(_todoController.todo?.name ?? '-'),
            actions: [
              TextButton(
                onPressed: () {
                  if (!_textStateController.isValidate) return;
                  _todoController.saveTodo(_todoTextController.text.trim());
                  Octopus.maybeOf(context)?.pop();
                },
                child: Text("Save"),
              ),
            ],
          ),
          body: Column(
            children: [
              ListenableBuilder(
                listenable: _textStateController,
                builder: (context, child) {
                  return TextField(
                    controller: _todoTextController,
                    decoration: InputDecoration(
                      errorText: _textStateController.error,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
