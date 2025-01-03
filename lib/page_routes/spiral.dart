import 'dart:math';
import 'package:flutter/cupertino.dart';

class Spiral extends PageRouteBuilder {
  final Widget page;

  Spiral({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final scale = Tween(begin: 0.0, end: 1.0).animate(animation);
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(scale.value)
          ..rotateZ(animation.value * 2 * pi),
        child: child,
      );
    },
    transitionDuration: const Duration(seconds: 2),
  );
}