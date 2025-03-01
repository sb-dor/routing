import 'package:routing/todo_octopus_src/common/models/todo.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_datasource.dart';

abstract interface class ITodosRepository {
  Future<List<Todo>> todoList();
}

final class TodosRepositoryImpl implements ITodosRepository {
  TodosRepositoryImpl(this._iTodosDatasource);

  final ITodosDatasource _iTodosDatasource;

  @override
  Future<List<Todo>> todoList() => _iTodosDatasource.todoList();
}
