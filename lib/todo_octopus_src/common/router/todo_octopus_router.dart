import 'package:flutter/src/widgets/framework.dart';
import 'package:octopus/octopus.dart';

enum TodoOctopusRouter with OctopusRoute {
  todos("todos"),
  todo("todo");

  const TodoOctopusRouter(this.name);

  @override
  final String name;

  @override
  Widget builder(BuildContext context, OctopusState state, OctopusNode node) {
    // TODO: implement builder
    throw UnimplementedError();
  }
}
