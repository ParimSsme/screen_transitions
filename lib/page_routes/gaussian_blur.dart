import 'dart:ui';
import 'package:flutter/cupertino.dart';

class GaussianBlur extends PageRouteBuilder {
  final Widget page;

  GaussianBlur({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double blurValue = (1 - animation.value) * 10;
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: child,
      );
    },
  );
}