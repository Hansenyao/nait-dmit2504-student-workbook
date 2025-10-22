import 'package:app_state_provider/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Last Name Page')),
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
            // Update our user last name here
            onPressed: () {
              user.lastName = 'Oberson';
            },
            child: const Icon(Icons.update),
          ),
        );
      },
    );
  }
}
