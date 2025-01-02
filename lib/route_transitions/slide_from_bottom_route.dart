import 'package:flutter/cupertino.dart';

class SlideFromBottomRoute extends PageRouteBuilder {
  final Widget page;

  SlideFromBottomRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
          .animate(animation);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}