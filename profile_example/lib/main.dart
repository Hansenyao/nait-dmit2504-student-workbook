import 'package:flutter/material.dart';
import './pages/profile_page.dart';
import './widgets/profile_images.dart';
import './widgets/profile_header.dart';
import './widgets/profile_info.dart';

//import 'package:json_theme/json_theme.dart';
//import 'package:flutter/services.dart'; // For rootBundle
//import 'dart:convert'; // For jsonDecode

void main() async {
  /*
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString(
    'assets/themes/appainter_theme.json',
  );
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
  */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //final ThemeData theme;
  //const MyApp({Key? key, required this.theme}) : super(key: key);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var lightTheme = ThemeData(
      fontFamily: 'ComicRelief',
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange,
        backgroundColor: Colors.green,
      ),
    );

    var darkTheme = lightTheme.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepOrange,
        cardColor: Colors.black87,
        backgroundColor: Colors.black87,
      ),
    );

    var materialApp = MaterialApp(
      themeMode: ThemeMode.light, // ThemeMode.dark,
      theme: lightTheme, //theme,
      darkTheme: darkTheme,
      home: ProfilePage(),
    );
    return materialApp;
  }
}
