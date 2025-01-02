import 'dart:math';
import 'package:flutter/material.dart';

class ShapeMorph extends PageRouteBuilder {
  final Widget page;

  ShapeMorph({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              double progress = animation.value;
              return CustomPaint(
                painter: ShapeMorphPainter(progress),
                child: SizedBox.expand(),
              );
            },
          ),
          FadeTransition(
            opacity: animation,
            child: child,
          ),
        ],
      );
    },
  );
}

class ShapeMorphPainter extends CustomPainter {
  final double progress;

  ShapeMorphPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.withValues(alpha: 1 - progress)
      ..style = PaintingStyle.fill;

    // Start with a circle and morph into a rounded rectangle
    double maxRadius = sqrt(pow(size.width, 2) + pow(size.height, 2)) / 2;
    double currentRadius = maxRadius * (1 - progress);

    double rectWidth = size.width * progress;
    double rectHeight = size.height * progress;
    double cornerRadius = max(0, 30 * (1 - progress));

    if (progress < 0.5) {
      // Circle phase
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        currentRadius,
        paint,
      );
    } else {
      // Rounded rectangle phase
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: rectWidth,
            height: rectHeight,
          ),
          Radius.circular(cornerRadius),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}