import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _animation = _controller.drive(CurveTween(curve: Curves.bounceInOut));
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rotation animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Basic animation using the pure controller (no curve)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(angle: _controller.value * 2 * math.pi);
              },
            ),
            SizedBox(height: 110),
            AnimatedBuilder(
              animation: _animation,
              child: Text("Curved Animations"),
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value * 2 * math.pi,
                  child: child,
                );
              },
            ),
            SizedBox(height: 110),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 2 * math.pi),
              duration: Duration(seconds: 6),
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value * math.pi / 180,
                  child: child,
                );
              },
              child: Text("Tween rotation"),
            ),
          ],
        ),
      ),
    );
  }
}
