import 'package:flutter/cupertino.dart';

class Rotate extends PageRouteBuilder {
  final Widget page;

  Rotate({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
      return RotationTransition(turns: rotationAnimation, child: child);
    },
  );
}