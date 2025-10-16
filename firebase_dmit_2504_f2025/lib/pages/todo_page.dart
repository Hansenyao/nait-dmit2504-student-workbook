import 'package:flutter/material.dart';
import 'package:firebase_dmit_2504_f2025/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> _todolist = [
    Todo(description: 'Paint office', completed: false),
    Todo(description: 'Install smoke detectors', completed: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_todolist[index].description),
              trailing: Checkbox(
                value: _todolist[index].completed,
                onChanged: (value) {
                  // TODO: Update the todo item status
                },
              ),
            );
          },
          itemCount: _todolist.length,
        ),
      ),
    );
  }
}
