import 'package:flutter/material.dart';

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
