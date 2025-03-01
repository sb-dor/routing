import 'package:flutter/foundation.dart';
import 'package:routing/todo_octopus_src/common/models/todo.dart';
import 'package:routing/todo_octopus_src/feature/todos/data/todos_repository.dart';

final class TodosController with ChangeNotifier {
  TodosController(this._iTodosRepository);

  final ITodosRepository _iTodosRepository;

  final List<Todo> todoList = [];

  void fetchTodos() async {
    todoList.clear();
    todoList.addAll(await _iTodosRepository.todoList());
    notifyListeners();
  }
}
