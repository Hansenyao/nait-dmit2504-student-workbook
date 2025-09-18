import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

import 'package:flutter/services.dart'; // For rootBundle
import 'dart:convert'; // For jsonDecode

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString(
    'assets/themes/appainter_theme.json',
  );
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  const MyApp({Key? key, required this.theme}) : super(key: key);
  // const MyApp({required this.theme, super.key});

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

    return MaterialApp(
      themeMode: ThemeMode.light, // ThemeMode.dark,
      theme: theme, //lightTheme,
      darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(title: Text('Layout example')),
        body: Center(
          child: Column(
            children: [
              // Header
              ProfileHeader(header: 'Employee Profile'),
              // Avatar
              ProfileImage(imageUrl: 'assets/images/avatar.jpg'),
              // Name
              Text(
                'Nathan humphrey',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // Profile Information
              Column(
                children: [
                  // Role
                  ProfileInfo(label: "Role", value: "Developer"),
                  // Team
                  ProfileInfo(label: "Team", value: "Font-End Main Project"),
                  // Handle
                  ProfileInfo(label: "Handle", value: "@NateAtNait"),
                  // Supervisor
                  ProfileInfo(label: "Supervisor", value: "Sally Anne"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final String header;
  const ProfileHeader({required this.header, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  const ProfileImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        border: Border.all(
          width: 4.0,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );

    /*
    return ClipOval(
      child: Image.asset(imageUrl, height: 250, width: 250, fit: BoxFit.cover),
    );*/
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;
  const ProfileInfo({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(value, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
