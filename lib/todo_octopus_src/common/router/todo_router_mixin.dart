import 'package:flutter/material.dart';
import 'package:octopus/octopus.dart';
import 'package:provider/provider.dart';
import 'package:routing/octopus_src/common/routing/own_authentication_guard_with_signin_navigation.dart';
import 'package:routing/todo_octopus_src/common/router/todo_octopus_router.dart';
import 'package:routing/todo_octopus_src/feature/auth/controllers/todo_auth_controller.dart';
import 'package:routing/todo_octopus_src/feature/init/widgets/material_context.dart';

mixin TodoRouterMixin on State<TodoApp> {
  late final Octopus todoOctopus;

  @override
  void initState() {
    super.initState();
    todoOctopus = Octopus(
      routes: TodoOctopusRouter.values,
      defaultRoute: TodoOctopusRouter.todos,
      // for setting initial route
      initialState: OctopusState.single(TodoOctopusRouter.todos.node()),
      guards: [
        OwnAuthenticationGuardWithSignInNavigation(
          getUser: () async => context.read<TodoAuthController>().user,
          guardedRoutes: <String>{
            TodoOctopusRouter.todo.name,
          },
          authenticationScreensNames: <String>{
            TodoOctopusRouter.todoAuth.name,
          },
          signInNavigation: OctopusState.single(TodoOctopusRouter.todoAuth.node()),
          homeNavigation: OctopusState.single(TodoOctopusRouter.todos.node()),
          refresh: context.read<TodoAuthController>(),
        ),
      ],
    );
  }
}
