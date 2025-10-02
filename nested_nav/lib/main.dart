import 'package:flutter/material.dart';
import 'package:nested_nav/pages/home_page.dart';
import 'package:nested_nav/pages/settings_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        Widget page;

        // Switch on the route name and selecte the page based off of that
        switch (settings.name) {
          case '/':
            page = HomePage();
            break;
          case '/settings/home':
            page = SettingsManager();
            break;
          default:
            throw Exception('Unknow Route Used: ${settings.name}');
        }

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}
