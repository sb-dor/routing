import 'package:routing/todo_octopus_src/common/constants.dart';
import 'package:routing/todo_octopus_src/common/models/todo.dart';

abstract interface class ITodosDatasource {
  Future<List<Todo>> todoList();
}

final class TodosDatasourceImpl implements ITodosDatasource {
  @override
  Future<List<Todo>> todoList() async {
    return todos;
  }
}
