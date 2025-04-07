
import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child:Row(
              children:[
                Expanded(
                  child:TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
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
                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone?TextDecoration.lineThrough:TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged:(_) => _toggleDone(index),
                  ),
                  trailing:IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed:()=> _deleteTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}