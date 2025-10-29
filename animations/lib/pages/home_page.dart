import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transforms')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Plain rotation transform
            Transform.rotate(
              angle: 30 * math.pi / 180,
              child: Text('Rotae Only'),
            ),
            SizedBox(height: 110),
            Transform.translate(
              offset: Offset(50, 50),
              child: Transform.scale(
                scale: 3,
                child: Transform.rotate(
                  angle: 65 * math.pi / 180,
                  child: Text('Nested transforms'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
