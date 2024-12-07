/*

ISAR TO DO MODEL

convert todo model into isar todo model hat we can store in our isar db.

*/

import 'package:flutter_application_1/domain/moduls/todo.dart';
import 'package:isar/isar.dart';

// to generate isar todo object, run: dart run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isComplete;

  // convert isar object -> pure todo object TO USE in our app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isComplete: isComplete,
    );
  }

  //convert pure todo object -> isar object to store in isar db
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isComplete = todo.isComplete;
  }
}
