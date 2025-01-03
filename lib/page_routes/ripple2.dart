import 'package:flutter/material.dart';

class Ripple2 extends PageRouteBuilder {
  final Widget page;

  Ripple2({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: RippleClipper(animation.value),
              child: Container(color: Colors.blue),
            ),
          ),
          FadeTransition(
            opacity: animation,
            child: child,
          ),
        ],
      );
    },
    transitionDuration: Duration(seconds: 2),
  );
}

class RippleClipper extends CustomClipper<Path> {
  final double progress;

  RippleClipper(this.progress);

  @override
  Path getClip(Size size) {
    double radius = size.longestSide * progress;
    return Path()..addOval(Rect.fromCircle(center: size.center(Offset.zero), radius: radius));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}