import 'package:flutter/foundation.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_repository.dart';

final class TodosController with ChangeNotifier {
  TodosController(this._iTodosRepository);

  final ITodosRepository _iTodosRepository;
}
