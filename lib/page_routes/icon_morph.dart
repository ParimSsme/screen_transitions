import 'package:flutter/material.dart';

class ComplexIconMorph extends PageRouteBuilder {
  final Widget page;
  final IconData iconData;

  ComplexIconMorph({required this.page, required this.iconData,})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var scaleAnimation = Tween<double>(begin: 1.0, end: 30.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );

      var rotationAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );

      var colorAnimation = ColorTween(begin: Colors.blue, end: Colors.transparent).animate(
        CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      );

      return Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnimation.value,
                child: Transform.rotate(
                  angle: rotationAnimation.value * 3.14159, // Full rotation
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colorAnimation.value,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(iconData, color: Colors.white),
                  ),
                ),
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