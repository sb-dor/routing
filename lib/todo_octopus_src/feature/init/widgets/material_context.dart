import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/todo_octopus_src/common/router/todo_router_mixin.dart';
import 'package:routing/todo_octopus_src/feature/auth/controllers/todo_auth_controller.dart';
import 'package:routing/todo_octopus_src/feature/init/logic/provider_factories.dart';
import 'package:routing/todo_octopus_src/feature/todos/controller/todos_controller.dart';

class TodoAppMaterialContext extends StatelessWidget {
  const TodoAppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodosController>(
          create: (_) => todosController(),
        ),
        ChangeNotifierProvider<TodoAuthController>(
          create: (_) => TodoAuthController(),
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
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
            TargetPlatform.values,
            value: (_) => FadeUpwardsPageTransitionsBuilder(),
          ),
        ),
      ),
    );
  }
}
