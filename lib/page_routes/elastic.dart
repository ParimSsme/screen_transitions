import 'package:flutter/cupertino.dart';

class Elastic extends PageRouteBuilder {
  final Widget page;

  Elastic({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final elasticAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut,
      );

      return ScaleTransition(
        scale: elasticAnimation,
        child: child,
      );
    },
  );
}