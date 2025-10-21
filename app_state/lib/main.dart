import 'package:flutter/material.dart';
import 'package:app_state/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(
        child: Scaffold(body: Center(child: HomePage())),
      ),
    );
  }
}
