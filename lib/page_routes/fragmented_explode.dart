import 'dart:math';
import 'package:flutter/material.dart';

class FragmentedExplode extends PageRouteBuilder {
  final Widget page;

  FragmentedExplode({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              double progress = animation.value;
              return Stack(
                children: _buildFragments(progress, context),
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

List<Widget> _buildFragments(double progress, BuildContext context) {
  const int rows = 10;
  const int columns = 10;
  final size = MediaQuery.of(context).size;

  List<Widget> fragments = [];

  for (int row = 0; row < rows; row++) {
    for (int column = 0; column < columns; column++) {
      final x = column * (size.width / columns);
      final y = row * (size.height / rows);
      final width = size.width / columns;
      final height = size.height / rows;

      final offsetX = (Random().nextDouble() - 0.5) * 300 * progress;
      final offsetY = (Random().nextDouble() - 0.5) * 300 * progress;

      fragments.add(Positioned(
        left: x + offsetX,
        top: y + offsetY,
        child: Transform.scale(
          scale: 1 - progress,
          child: SizedBox(
            width: width,
            height: height,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.white, width: 0.5),
              ),
            ),
          ),
        ),
      ));
    }
  }

  return fragments;
}