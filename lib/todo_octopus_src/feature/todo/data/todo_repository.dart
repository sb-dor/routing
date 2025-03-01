import 'package:routing/todo_octopus_src/common/models/todo.dart';
import 'package:routing/todo_octopus_src/feature/todo/data/todo_datasource.dart';

abstract interface class ITodoRepository {
  Future<Todo> todo(String id);
}

final class TodoRepositoryImpl implements ITodoRepository {
  TodoRepositoryImpl(this._iTodoDatasource);

  final ITodoDatasource _iTodoDatasource;

  @override
  Future<Todo> todo(String id) => _iTodoDatasource.todo(id);
}
