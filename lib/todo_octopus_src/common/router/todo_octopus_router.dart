import 'package:flutter/src/widgets/framework.dart';
import 'package:octopus/octopus.dart';
import 'package:routing/todo_octopus_src/feature/todo/widgets/todo_widget.dart';
import 'package:routing/todo_octopus_src/feature/todos/widgets/todos_widget.dart';

enum TodoOctopusRouter with OctopusRoute {
  todos("todos"),
  todo("todo");

  const TodoOctopusRouter(this.name);

  @override
  final String name;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) {
    return switch (this) {
      TodoOctopusRouter.todos => TodosWidget(),
      TodoOctopusRouter.todo => TodoWidget(todoId: state.arguments['todo_id'] as String),
    };
  }
}
