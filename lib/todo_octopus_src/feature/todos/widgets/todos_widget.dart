import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:routing/todo_octopus_src/common/router/todo_octopus_router.dart';
import 'package:routing/todo_octopus_src/feature/auth/controllers/todo_auth_controller.dart';
import 'package:routing/todo_octopus_src/feature/todos/controller/todos_controller.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_datasource.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_repository.dart';

class TodosWidget extends StatefulWidget {
  const TodosWidget({super.key});

  @override
  State<TodosWidget> createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  late final TodosController _todosController;

  @override
  void initState() {
    super.initState();
    _todosController = context.read<TodosController>();
    _todosController.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test with todos"),
        actions: [
          ElevatedButton(
            onPressed: () {
              context.read<TodoAuthController>().authenticate(navigate: () {});
            },
            child: Text("Login"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TodoAuthController>().logout();
            },
            child: Text("Logout"),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: _todosController,
        builder: (context, child) {
          return CustomScrollView(
            slivers: [
              SliverList.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: _todosController.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_todosController.todoList[index].name),
                    onTap: () {
                      Octopus.maybeOf(context)?.setState(
                        (states) {
                          return states
                            ..add(
                              TodoOctopusRouter.todo.node(
                                arguments: {
                                  "todoId": _todosController.todoList[index].id,
                                },
                              ),
                            );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
