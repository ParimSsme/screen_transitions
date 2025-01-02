import 'package:flutter/cupertino.dart';

class Fade extends PageRouteBuilder {
  final Widget page;

  Fade({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}