import 'package:flutter/cupertino.dart';

class Flip3dVertical<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;

  Flip3dVertical({
    required this.page,
    this.duration = const Duration(seconds: 1),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Flip animation along the Y-axis
      var flipAnimation = Tween<double>(
        begin: 1.0, // Start fully visible
        end: 0.0, // Flip over (disappears on the backside)
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));

      // Create a 3D vertical flip using Transform
      return AnimatedBuilder(
        animation: flipAnimation,
        builder: (context, child) {
          // Flip the screen vertically along the Y-axis
          return Transform(
            transform: Matrix4.rotationX(flipAnimation.value * 3.14159), // Rotation in radians
            alignment: Alignment.center,
            child: child,
          );
        },
        child: child,
      );
    },
  );
}