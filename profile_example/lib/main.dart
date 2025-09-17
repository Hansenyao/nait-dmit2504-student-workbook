import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Layout example')),
        body: Center(
          child: Column(
            children: [
              // Header
              ProfileHeader(header: 'Employee Profile'),
              // Avatar
              ProfileImage(imageUrl: '/assets/images/avatar.jpg'),
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
      style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  const ProfileImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(imageUrl, height: 250, width: 250, fit: BoxFit.cover),
    );
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
