import 'package:routing/todo_octopus_src/common/constants.dart';
import 'package:routing/todo_octopus_src/common/models/todo.dart';

abstract interface class ITodoDatasource {
  Future<Todo> todo(String id);
}

final class TodoDatasourceImpl implements ITodoDatasource {
  @override
  Future<Todo> todo(String id) async {
    return todos.firstWhere((element) => element.id == id);
  }
}
