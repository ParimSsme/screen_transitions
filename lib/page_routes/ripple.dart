import 'package:flutter/material.dart';

class Ripple extends PageRouteBuilder {
  final Widget page;

  Ripple({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          child,
          Positioned.fill(
            child: ClipPath(
              clipper: RippleClipper(animation.value),
              child: Container(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      );
    },
  );
}

class RippleClipper extends CustomClipper<Path> {
  final double progress;

  RippleClipper(this.progress);

  @override
  Path getClip(Size size) {
    double maxRadius = size.longestSide;
    double radius = progress * maxRadius;

    Path path = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: radius,
      ));
    return path;
  }

  @override
  bool shouldReclip(covariant RippleClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}