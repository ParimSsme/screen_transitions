import 'package:flutter/cupertino.dart';

class SlideFromRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromRightRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
          .animate(animation);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}