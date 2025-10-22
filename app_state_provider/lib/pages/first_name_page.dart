import 'package:app_state_provider/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('First Name Page')),
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                ListenableBuilder(
                  listenable: user,
                  builder: (context, child) {
                    return Text(
                      'User name: ${user.firstName} ${user.lastName}',
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // Update our user firs name here
            onPressed: () {
              user.firstName = 'Bob';
            },
            child: const Icon(Icons.update),
          ),
        );
      },
    );
  }
}
