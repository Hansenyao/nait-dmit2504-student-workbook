import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_state_provider/models/user.dart';
import 'pages/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User('Gary', 'Gygax'),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap material app with a user Notifier
    return UserNotifier(
      user: user,
      child: MaterialApp(
        home: Scaffold(body: Center(child: HomePage())),
      ),
    );
  }
}
