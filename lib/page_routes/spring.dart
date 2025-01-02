import 'package:flutter/cupertino.dart';

class Spring extends PageRouteBuilder {
  final Widget page;

  Spring({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const double initialScale = 1.2; // Scale slightly larger at the start
      const double endScale = 1.0; // End at normal size

      Animation<double> scaleAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut, // Spring effect
      );

      return ScaleTransition(
        scale: Tween<double>(
          begin: initialScale,
          end: endScale,
        ).animate(scaleAnimation),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}