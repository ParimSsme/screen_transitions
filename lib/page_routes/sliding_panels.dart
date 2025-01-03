import 'package:flutter/cupertino.dart';

class SlidingPanels extends PageRouteBuilder {
  final Widget page;

  SlidingPanels({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideOut = Tween<Offset>(begin: Offset.zero, end: Offset(-1.0, 0.0)).animate(animation);
      final slideIn = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero).animate(animation);

      return Stack(
        children: [
          SlideTransition(
            position: slideOut,
            child: child,
          ),
          SlideTransition(
            position: slideIn,
            child: page,
          ),
        ],
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}