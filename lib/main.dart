import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/pages/todo_home_page.dart';

void main(){
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context){
    return CupertinoApp(
      title: "Todo App",
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: const TodoHomePage(),
    );
}
}