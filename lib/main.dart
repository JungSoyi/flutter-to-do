import 'package:flutter/material.dart';
import 'package:flutter_to_do/pages/todo_home_page.dart';

void main(){
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:"Todo App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoHomePage(),
    );
  }
}



