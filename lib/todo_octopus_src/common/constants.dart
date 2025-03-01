import 'package:faker/faker.dart';
import 'package:routing/todo_octopus_src/common/models/todo.dart';

final List<Todo> todos = List.generate(
  20,
  (index) => Todo(
    name: Faker().person.name(),
  ),
);
