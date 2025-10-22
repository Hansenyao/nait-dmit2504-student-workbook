import 'package:app_state_provider/widgets/user_notifier.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:app_state_provider/models/user.dart';

void main() {
  runApp(const MainApp());
}

User user = User('Tom', 'Maurer');

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
