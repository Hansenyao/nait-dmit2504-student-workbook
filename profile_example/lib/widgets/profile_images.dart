import 'package:flutter/material.dart';

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
