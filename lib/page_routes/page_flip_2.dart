import 'dart:math';
import 'package:flutter/cupertino.dart';

class PageFlip2 extends PageRouteBuilder {
  final Widget page;

  PageFlip2({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

      return AnimatedBuilder(
        animation: curvedAnimation,
        builder: (context, child) {
          final value = curvedAnimation.value;
          final angle = value * pi; // Rotate from 0 to π (180 degrees)

          return Stack(
            children: [
              // Outgoing screen during the first half
              if (value <= 0.5)
                Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Add perspective
                    ..rotateY(-angle),
                  child: child,
                ),
              // Incoming screen during the second half
              if (value > 0.5)
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Add perspective
                    ..rotateY(pi - angle),
                  child: page,
                ),
            ],
          );
        },
        child: child,
      );
    },
  );

  @override
  Duration get transitionDuration => Duration(seconds: 2);

}