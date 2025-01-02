import 'package:flutter/cupertino.dart';

class DiagonalSlideRoute extends PageRouteBuilder {
  final Widget page;

  DiagonalSlideRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, -1.0); // Starts from top-left diagonally
      const end = Offset.zero; // Ends at the center
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}