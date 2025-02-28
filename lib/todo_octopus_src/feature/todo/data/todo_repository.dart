import 'package:routing/todo_octopus_src/feature/todo/data/todo_datasource.dart';

abstract interface class ITodoRepository {}

final class TodoRepositoryImpl implements ITodoRepository {
  TodoRepositoryImpl(this._iTodoDatasource);

  final ITodoDatasource _iTodoDatasource;
}
