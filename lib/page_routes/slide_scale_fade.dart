import 'package:flutter/cupertino.dart';

class SlideScaleFade extends PageRouteBuilder {
  final Widget page;

  SlideScaleFade({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var slideAnimation = Tween<Offset>(begin: Offset(1.0, 1.0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeInOut))
          .animate(animation);

      var scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(animation);
      var fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

      return SlideTransition(
        position: slideAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        ),
      );
    },
  );
}