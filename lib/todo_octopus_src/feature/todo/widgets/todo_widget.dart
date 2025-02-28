import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
