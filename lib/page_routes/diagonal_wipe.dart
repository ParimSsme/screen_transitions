import 'package:flutter/cupertino.dart';

class DiagonalWipe extends PageRouteBuilder {
  final Widget page;

  DiagonalWipe({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offset = Tween(begin: Offset(1, -1), end: Offset.zero).animate(animation);
      return SlideTransition(position: offset, child: page);
    },
    transitionDuration: const Duration(seconds: 2),
  );
}