import 'package:flutter/cupertino.dart';

class Accordion extends PageRouteBuilder {
  final Widget page;

  Accordion({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(milliseconds: 800),
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // Calculate the accordion effect (expanding both width and height)
        double scale = animation.value;
        double perspective = 1 - (0.5 * scale); // To simulate depth

        // Create the accordion transformation (expanding both vertically and horizontally)
        return Transform(
          transform: Matrix4.identity()
            ..scale(scale, scale)
            ..setEntry(3, 2, perspective), // Adds perspective
          alignment: Alignment.center,
          child: Opacity(
            opacity: scale, // Increase opacity as it expands
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}