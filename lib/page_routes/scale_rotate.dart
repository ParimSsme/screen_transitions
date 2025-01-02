import 'package:flutter/cupertino.dart';

class ScaleRotate extends PageRouteBuilder {
  final Widget page;

  ScaleRotate({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
      var rotationAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(animation);

      return ScaleTransition(
        scale: scaleAnimation,
        child: RotationTransition(turns: rotationAnimation, child: child),
      );
    },
  );
}
