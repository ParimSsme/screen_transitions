import 'package:flutter/material.dart';

class CurlPage extends PageRouteBuilder {
  final Widget page;

  CurlPage({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final progress = animation.value;

          return Stack(
            children: [
              // The incoming screen is rendered as is
              child ?? SizedBox.shrink(),
              // The curling effect overlay
              Positioned.fill(
                child: CustomPaint(
                  painter: CurlPagePainter(progress),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ],
          );
        },
        child: page,
      );
    },
  );

  @override
  Duration get transitionDuration => Duration(seconds: 1);

}

class CurlPagePainter extends CustomPainter {
  final double progress;

  CurlPagePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    // Define the curl effect
    final curlX = size.width * progress;
    final curlY = size.height * (1 - progress);

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(curlX, curlY)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CurlPagePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}