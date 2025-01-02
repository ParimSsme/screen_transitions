import 'package:flutter/cupertino.dart';

class CrossFade extends PageRouteBuilder {
  final Widget page;

  CrossFade({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade Animation
      var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      // Scale Animation
      var scaleAnimation = Tween<double>(begin: 0.8, end: 1.0)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      // Rotation Animation
      var rotationAnimation = Tween<double>(begin: -0.2, end: 0.0)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      return FadeTransition(
        opacity: fadeAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: RotationTransition(
            turns: rotationAnimation,
            child: child,
          ),
        ),
      );
    },
  );
}