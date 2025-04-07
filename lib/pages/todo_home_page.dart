
import 'package:flutter/cupertino.dart';
import 'package:flutter_to_do/models/todo.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo(){
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _todos.add(Todo(title:text));
      _controller.clear();
    });
  }

  void _toggleDone(int index) {
    setState((){
      _todos[index].isDone = !_todos[index].isDone;
    });
  }

  void _deleteTodo(int index){
    setState((){
      _todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Todo List')),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child:Row(
              children:[
                Expanded(
                  child:CupertinoTextField(
                    controller: _controller,
                    placeholder: 'Enter a task',
                  ),
                ),
                const SizedBox(width: 10),
                CupertinoButton(
                  onPressed: _addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index){
                final todo = _todos[index];
                return Row(
                  children: [
                    CupertinoSwitch(
                      value:todo.isDone,
                      onChanged: (_)=> _toggleDone(index),
                    ),
                    Expanded(child: Text(todo.title),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => _deleteTodo(index),
                      child:Icon(CupertinoIcons.delete)
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



