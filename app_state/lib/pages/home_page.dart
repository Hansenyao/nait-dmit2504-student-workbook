import 'package:flutter/material.dart';
import 'package:app_state/models/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}) : user = User("", "");

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firt Name Page')),
      body: const Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24.0),
            ElevatedButton(onPressed: () {}, child: Text("First Name Page")),
          ],
        ),
      ),
    );
  }
}
