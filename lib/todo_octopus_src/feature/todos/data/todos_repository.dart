import 'package:routing/todo_octopus_src/feature/todos/data/todos_datasource.dart';

abstract interface class ITodosRepository {}

final class TodosRepositoryImpl implements ITodosRepository {
  TodosRepositoryImpl(this._iTodosDatasource);

  final ITodosDatasource _iTodosDatasource;
}
