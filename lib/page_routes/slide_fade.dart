import 'package:flutter/cupertino.dart';

class SlideFade extends PageRouteBuilder {
  final Widget page;

  SlideFade({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var slideAnimation = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

      return SlideTransition(
        position: slideAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: child),
      );
    },
  );
}