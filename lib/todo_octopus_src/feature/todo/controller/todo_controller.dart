import 'package:flutter/foundation.dart';
import 'package:routing/todo_octopus_src/feature/todo/data/todo_repository.dart';

final class TodoController with ChangeNotifier {
  TodoController(this._iTodoRepository);

  final ITodoRepository _iTodoRepository;
}
