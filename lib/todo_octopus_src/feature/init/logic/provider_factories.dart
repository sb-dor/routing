import 'package:routing/todo_octopus_src/feature/todo/controller/todo_controller.dart';
import 'package:routing/todo_octopus_src/feature/todo/data/todo_datasource.dart';
import 'package:routing/todo_octopus_src/feature/todo/data/todo_repository.dart';
import 'package:routing/todo_octopus_src/feature/todos/controller/todos_controller.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_datasource.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_repository.dart';

TodoController todoController() {
  final ITodoDatasource datasource = TodoDatasourceImpl();
  final ITodoRepository repository = TodoRepositoryImpl(datasource);
  return TodoController(repository);
}

TodosController todosController() {
  final ITodosDatasource datasource = TodosDatasourceImpl();
  final ITodosRepository repository = TodosRepositoryImpl(datasource);
  return TodosController(repository);
}
