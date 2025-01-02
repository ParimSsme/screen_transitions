import 'package:flutter/cupertino.dart';

class SlideFromLeftRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromLeftRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
          .animate(animation);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}