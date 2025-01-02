import 'package:flutter/cupertino.dart';

class ParallaxZoom extends PageRouteBuilder {
  final Widget page;

  ParallaxZoom({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final double scale = 1 + (0.2 * (1 - animation.value));
          return Transform.scale(
            scale: scale,
            child: Transform.translate(
              offset: Offset(0, (1 - animation.value) * 50),
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}