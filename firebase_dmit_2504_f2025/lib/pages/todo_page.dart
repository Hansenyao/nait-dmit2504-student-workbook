import 'package:firebase_dmit_2504_f2025/pages/app_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dmit_2504_f2025/models/todo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key, required this.appState});

  final ApplicationState appState;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> _todolist = [];

  @override
  void initState() {
    super.initState();

    // On load get the todos from app status
    setState(() {
      _todolist = widget.appState.todos!;
    });
  }

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
                  // Update frontend first
                  setState(() {
                    _todolist[index].completed = value!;
                  });
                  // Update backend next (we should handle failtures but we won't in this example)
                  widget.appState.updateTodo(_todolist[index]);
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
