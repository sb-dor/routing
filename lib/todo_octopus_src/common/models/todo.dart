import 'package:uuid/uuid.dart';

final class Todo {
  final String id;
  final String name;

  Todo({required this.name}) : id = Uuid().v4();
}
