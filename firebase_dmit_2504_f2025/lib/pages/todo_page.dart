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
            return Dismissible(
              key: UniqueKey(),
              child: ListTile(
                title: Text(_todolist[index].description),
                trailing: Checkbox(
                  value: _todolist[index].completed,
                  onChanged: (value) {
                    setState(() {
                      // Update frontend first
                      _todolist[index].completed = value!;
                      // Update backend next (we should handle failtures but we won't in this example)
                      widget.appState.updateTodo(_todolist[index]);
                    });
                  },
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  _todolist.removeAt(index);
                  widget.appState.deleteTodo(_todolist[index]);
                });
              },
            );
          },
          itemCount: _todolist.length,
        ),
      ),
    );
  }
}
