import 'package:flutter/cupertino.dart';

class Flip3dHorizontal extends PageRouteBuilder {
  final Widget page;

  Flip3dHorizontal({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          // Calculate the rotation angle
          final double angle = animation.value * 3.14159; // π radians = 180 degrees
          final bool isUnder = angle > 1.5708; // Check if rotation passed 90 degrees

          return Stack(
            children: [
              // Render the first screen (current screen)
              if (!isUnder)
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(angle),
                  child: child,
                ),
              // Render the second screen (next screen)
              if (isUnder)
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateY(angle - 3.14159), // Flip 180 degrees
                  child: page,
                ),
            ],
          );
        },
      );
    },
  );
}