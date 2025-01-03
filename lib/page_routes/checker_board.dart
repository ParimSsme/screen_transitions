import 'package:flutter/material.dart';

class CheckerBoard extends PageRouteBuilder {
  final Widget page;

  CheckerBoard({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          ...List.generate(4, (row) {
            return List.generate(4, (col) {
              final tileAnimation = Tween<double>(begin: 1.0, end: 0.0)
                  .animate(CurvedAnimation(
                parent: animation,
                curve: Interval(
                  (row * 4 + col) / 16,
                  1.0,
                  curve: Curves.easeOut,
                ),
              ));
              return AnimatedBuilder(
                animation: tileAnimation,
                builder: (context, _) {
                  return Transform.scale(
                    scale: tileAnimation.value,
                    child: Align(
                      alignment: Alignment(-1.0 + col * 0.5, -1.0 + row * 0.5),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 4,
                        color: (row + col) % 2 == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                  );
                },
              );
            });
          }).expand((element) => element),
          FadeTransition(opacity: animation, child: child),
        ],
      );
    },
    transitionDuration: const Duration(seconds: 1),
  );
}
