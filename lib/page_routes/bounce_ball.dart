
import 'package:flutter/material.dart';

class BounceBall extends PageRouteBuilder {
  final Widget page;

  BounceBall({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(seconds: 2), // Duration of the animation
  );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            // Calculate the vertical position of the ball
            double bounceValue = _bounce(animation.value);
            return Positioned(
              bottom: bounceValue,
              left: MediaQuery.of(context).size.width / 2 - 20,
              child: _Ball(),
            );
          },
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            // Fade the next page in as the animation progresses
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        ),
      ],
    );
  }

  double _bounce(double t) {
    // Simulates a bounce effect: creating a bounce curve
    return (1 - (t - 0.5).abs()) * 200; // Bouncing effect within a specific range
  }

}

class _Ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }
}