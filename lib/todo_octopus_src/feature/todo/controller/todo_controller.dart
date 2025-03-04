import 'package:flutter/foundation.dart';
import 'package:routing/todo_octopus_src/common/models/todo.dart';
import 'package:routing/todo_octopus_src/feature/todo/data/todo_repository.dart';

final class TodoController with ChangeNotifier {
  TodoController(this._iTodoRepository);

  final ITodoRepository _iTodoRepository;

  Todo? todo;

  void fetchTodo(String id) async {
    todo = await _iTodoRepository.todo(id);
    notifyListeners();
  }

  void saveTodo(String name) {
    todo = todo?.copyWith(name: name);
    notifyListeners();
  }
}
