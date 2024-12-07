/* 

TO DO CUBIT - simple state management

each cubit is a list of todos.

*/

import 'package:flutter_application_1/domain/moduls/todo.dart';
import 'package:flutter_application_1/domain/repository/todo_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  //refence todo repo
  final TodoRepo todoRepo;

  //constructor initializes the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  //L O A D
  Future<void> loadTodos() async {
    //fetch list of todos from repo
    final todoList = await todoRepo.getTodos();

    // emit the fetched list as the new state
    emit(todoList);
  }

  //A D D
  Future<void> addTodo(String text) async {
    //create a new todo with unique Id
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
    );

    //save the new todo to repo
    loadTodos();
  }

  //D E L E T E
  Future<void> deleteTodo(Todo todo) async {
    //delete the provide todo from repo
    await todoRepo.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  // T O G G L E
  Future<void> toggleCompletion(Todo todo) async {
    //toggle the completetion status of provide todo
    final updateTodo = todo.toogleCompletion();

    //update the todo in repo with new completion status
    await todoRepo.updateTodo(updateTodo);

    // re-load
    loadTodos();
  }
}
