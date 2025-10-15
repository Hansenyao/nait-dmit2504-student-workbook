import 'package:firebase_dmit_2504_f2025/pages/app_state.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.authAppState});

  final ApplicationState authAppState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListenableBuilder(
          listenable: authAppState,
          builder: (context, _) {
            return authAppState.isLongIn
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
                    child: Text(''),
                  )
                : ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/sign-in');
                    },
                    child: Text('go to sign in'),
                  );
          },
        ),
      ),
    );
  }
}
