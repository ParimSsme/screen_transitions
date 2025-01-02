import 'package:flutter/cupertino.dart';

class FlipVertical extends PageRouteBuilder {
  final Widget page;

  FlipVertical({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var flipAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(animation);
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationX(flipAnimation.value),
        child: child,
      );
    },
  );
}