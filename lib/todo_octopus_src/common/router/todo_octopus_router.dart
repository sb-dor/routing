import 'package:flutter/src/widgets/framework.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/todo_octopus_src/feature/auth/widgets/todo_authentication_screen.dart';
import 'package:routing/todo_octopus_src/feature/todo/widgets/todo_widget.dart';
import 'package:routing/todo_octopus_src/feature/todos/widgets/todos_widget.dart';

enum TodoOctopusRouter with OctopusRoute {
  todos("todos"),
  todo("todo"),
  todoAuth("todoAuth");

  const TodoOctopusRouter(this.name);

  @override
  final String name;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) {
    return switch (this) {
      TodoOctopusRouter.todos => TodosWidget(),
      TodoOctopusRouter.todo => TodoWidget(todoId: node.arguments['todoId'] as String),
      TodoOctopusRouter.todoAuth => TodoAuthenticationScreen(),
    };
  }
}
