/*

TO DO REPOSITORY

Here you define what the App can do.

*/

import 'package:flutter_application_1/domain/moduls/todo.dart';

abstract class TodoRepo {
  //get list todos
  Future<List<Todo>> getTodos();

  //add new a todo
  Future<void> addTodo(Todo newTodo);

  //update an existing todo
  Future<void> updateTodo(Todo todo);

  //delete a todo
  Future<void> deleteTodo(Todo todo);
}
