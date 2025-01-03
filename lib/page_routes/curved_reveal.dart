import 'package:flutter/cupertino.dart';

class CurvedReveal extends PageRouteBuilder {
  final Widget page;

  CurvedReveal({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return (animation.value == 1)
              ? child ?? SizedBox.shrink()
              : ClipPath(
            clipper: CurvedClipper(animation.value),
            child: child,
          );
        },
        child: page,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}

class CurvedClipper extends CustomClipper<Path> {
  final double progress;

  CurvedClipper(this.progress);

  @override
  Path getClip(Size size) {
    final path = Path();

    // Calculate the maximum width for full reveal
    final revealWidth = size.width * progress;
    final curveControlY = size.height * 0.5; // Control point for the curve

    path.moveTo(0, 0);
    path.lineTo(revealWidth, 0);
    path.quadraticBezierTo(
      revealWidth * 0.5, // Midpoint of the curve
      curveControlY,
      revealWidth,
      size.height,
    );
    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CurvedClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}