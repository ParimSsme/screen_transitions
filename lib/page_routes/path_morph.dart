import 'dart:ui';
import 'package:flutter/material.dart';

class PathMorph extends PageRouteBuilder {
  final Widget page;

  PathMorph({required this.page})
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
                painter: PathMorphPainter(progress),
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

class PathMorphPainter extends CustomPainter {
  final double progress;

  PathMorphPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue.withValues(alpha: 1 - progress)
      ..style = PaintingStyle.fill;

    // Define the starting path (e.g., a star)
    Path startPath = Path();
    startPath.moveTo(size.width * 0.5, size.height * 0.1);
    startPath.lineTo(size.width * 0.6, size.height * 0.3);
    startPath.lineTo(size.width * 0.9, size.height * 0.4);
    startPath.lineTo(size.width * 0.6, size.height * 0.5);
    startPath.lineTo(size.width * 0.7, size.height * 0.9);
    startPath.lineTo(size.width * 0.5, size.height * 0.7);
    startPath.lineTo(size.width * 0.3, size.height * 0.9);
    startPath.lineTo(size.width * 0.4, size.height * 0.5);
    startPath.lineTo(size.width * 0.1, size.height * 0.4);
    startPath.lineTo(size.width * 0.4, size.height * 0.3);
    startPath.close();

    // Define the ending path (e.g., a circle)
    Path endPath = Path();
    endPath.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width * 0.4,
    ));

    // Interpolate between the paths
    Path morphPath = _interpolatePaths(startPath, endPath, progress);

    // Draw the morphing path
    canvas.drawPath(morphPath, paint);
  }

  Path _interpolatePaths(Path start, Path end, double t) {
    PathMetrics startMetrics = start.computeMetrics();
    PathMetrics endMetrics = end.computeMetrics();

    Path result = Path();

    for (final startMetric in startMetrics) {
      final endMetric = endMetrics.firstWhere(
            (metric) => metric.length == startMetric.length,
        orElse: () => startMetric,
      );

      for (double pos = 0.0; pos < startMetric.length; pos += 1.0) {
        final Offset startPoint = startMetric.getTangentForOffset(pos)!.position;
        final Offset endPoint = endMetric.getTangentForOffset(pos)!.position;

        final Offset interpolated = Offset(
          lerpDouble(startPoint.dx, endPoint.dx, t)!,
          lerpDouble(startPoint.dy, endPoint.dy, t)!,
        );

        if (pos == 0.0) {
          result.moveTo(interpolated.dx, interpolated.dy);
        } else {
          result.lineTo(interpolated.dx, interpolated.dy);
        }
      }
    }

    result.close();
    return result;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}