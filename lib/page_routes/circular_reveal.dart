import 'package:flutter/cupertino.dart';

class CircularReveal extends PageRouteBuilder {
  final Widget page;

  CircularReveal({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: CircularRevealClipper(animation.value),
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double revealProgress;

  CircularRevealClipper(this.revealProgress);

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = revealProgress * size.longestSide;
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) =>
      revealProgress != oldClipper.revealProgress;
}