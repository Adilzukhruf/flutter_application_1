import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/isar_todo.dart';
import 'package:flutter_application_1/data/repository/isar_todo_repo.dart';
import 'package:flutter_application_1/domain/repository/todo_repo.dart';
import 'package:flutter_application_1/presentation/todo_page.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

// open isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

// initialize the repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);

// run app
  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  // database injection through the app
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}