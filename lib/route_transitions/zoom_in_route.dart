import 'package:flutter/cupertino.dart';

class ZoomInRoute extends PageRouteBuilder {
  final Widget page;

  ZoomInRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Scale Animation
      var scaleAnimation = Tween<double>(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.fastOutSlowIn))
          .animate(animation);

      return ScaleTransition(
        scale: scaleAnimation,
        child: child,
      );
    },
  );
}