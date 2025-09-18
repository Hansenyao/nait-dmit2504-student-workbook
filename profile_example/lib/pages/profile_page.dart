import 'package:flutter/material.dart';
import 'package:profile_example/widgets/profile_header.dart';
import 'package:profile_example/widgets/profile_images.dart';
import 'package:profile_example/widgets/profile_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout example')),
      body: Center(
        child: Column(
          children: [
            // Header
            ProfileHeader(header: 'Employee Profile'),
            // Avatar
            ProfileImage(imageUrl: 'assets/images/avatar.jpg'),
            // Name
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nathan humphrey',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
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
    );
  }
}
