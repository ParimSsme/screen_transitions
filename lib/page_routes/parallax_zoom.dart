import 'package:flutter/cupertino.dart';

class ParallaxZoom<T> extends PageRouteBuilder<T> {
  final Widget page;
  final Duration duration;

  ParallaxZoom({
    required this.page,
    this.duration = const Duration(seconds: 1),
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Parallax effect: Background moves at a different speed
      var parallaxAnimation = Tween<Offset>(
        begin: Offset.zero,
        end: Offset(0.0, 0.1), // Adjust the parallax factor as needed
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));

      // Zoom effect: Scale the new screen
      var zoomAnimation = Tween<double>(
        begin: 0.8, // Start smaller
        end: 1.0,   // End at full size
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      ));

      return Stack(
        children: [
          // Background with parallax effect
          SlideTransition(
            position: parallaxAnimation,
            child: child,
          ),
          // Foreground with zoom effect
          ScaleTransition(
            scale: zoomAnimation,
            child: child,
          ),
        ],
      );
    },
  );
}