import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/todo_octopus_src/common/router/todo_octopus_router.dart';
import 'package:routing/todo_octopus_src/feature/init/widgets/material_context.dart';

mixin TodoRouterMixin on State<TodoApp> {
  late final Octopus todoOctopus;

  @override
  void initState() {
    super.initState();
    todoOctopus = Octopus(
      routes: TodoOctopusRouter.values,
      defaultRoute: TodoOctopusRouter.todos,
      guards: [],
    );
  }
}
