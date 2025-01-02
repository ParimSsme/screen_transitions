import 'package:flutter/cupertino.dart';



class BounceWithRotation<T> extends PageRouteBuilder<T> {
  final Widget page;

  BounceWithRotation({
    required this.page,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Apply multiple animations for a complex effect

      // Curved animation for bounce effect
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut, // Change to `bounceOut`, `elasticOut`, etc.
      );

      // Define the offset animation for sliding from below
      var offsetAnimation = Tween<Offset>(
        begin: const Offset(0, 1), // Start below the screen
        end: Offset.zero, // End at normal position
      ).animate(curvedAnimation);

      // Define scale animation (increasing and decreasing size)
      var scaleAnimation = Tween<double>(
        begin: 0.8, // Start smaller
        end: 1.0, // End at full size
      ).animate(curvedAnimation);

      // Define rotation animation (a subtle rotation effect)
      var rotationAnimation = Tween<double>(
        begin: 0.5, // Rotate slightly
        end: 0.0, // End with no rotation
      ).animate(curvedAnimation);

      // Use a combination of SlideTransition, ScaleTransition, and RotationTransition
      return Stack(
        children: [
          SlideTransition(
            position: offsetAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: RotationTransition(
                turns: rotationAnimation,
                child: child,
              ),
            ),
          ),
        ],
      );
    },
  );
}