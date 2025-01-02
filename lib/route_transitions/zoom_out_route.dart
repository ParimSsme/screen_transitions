import 'package:flutter/cupertino.dart';

class ZoomOutPageRoute extends PageRouteBuilder {
  final Widget page;

  ZoomOutPageRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Reverse Scale Animation
      var scaleAnimation = Tween<double>(begin: 1.5, end: 1.0)
          .chain(CurveTween(curve: Curves.fastOutSlowIn))
          .animate(animation);

      return ScaleTransition(
        scale: scaleAnimation,
        child: child,
      );
    },
  );
}
