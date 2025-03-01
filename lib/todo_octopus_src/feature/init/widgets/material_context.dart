import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/todo_octopus_src/common/router/todo_router_mixin.dart';
import 'package:routing/todo_octopus_src/feature/init/logic/provider_factories.dart';
import 'package:routing/todo_octopus_src/feature/todo/controller/todo_controller.dart';
import 'package:routing/todo_octopus_src/feature/todos/controller/todos_controller.dart';
import 'package:routing/todo_octopus_src/feature/todos/widgets/todos_widget.dart';

class TodoAppMaterialContext extends StatelessWidget {
  const TodoAppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoController>(
          create: (_) => todoController(),
        ),
        ChangeNotifierProvider<TodosController>(
          create: (_) => todosController(),
        ),
      ],
      child: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> with TodoRouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: todoOctopus.config,
    );
  }
}
