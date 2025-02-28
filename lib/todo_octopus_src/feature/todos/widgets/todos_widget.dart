import 'package:flutter/material.dart';
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
    final ITodosDatasource datasource = TodosDatasourceImpl();
    final ITodosRepository repository = TodosRepositoryImpl(datasource);
    _todosController = TodosController(repository);
  }

  @override
  void dispose() {
    _todosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test with todos"),
      ),
      body: ListenableBuilder(
        listenable: _todosController,
        builder: (context, child) {
          return CustomScrollView(
            slivers: [],
          );
        },
      ),
    );
  }
}
