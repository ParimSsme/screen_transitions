import 'package:flutter/material.dart';
import 'package:screen_transitions/page_routes/center_zoom.dart';
import 'package:screen_transitions/page_routes/cross_fade.dart';
import 'package:screen_transitions/page_routes/diagonal_slide.dart';
import 'package:screen_transitions/page_routes/fade.dart';
import 'package:screen_transitions/page_routes/slide_from_bottom.dart';
import 'package:screen_transitions/page_routes/slide_from_left.dart';
import 'package:screen_transitions/page_routes/slide_from_right.dart';
import 'package:screen_transitions/page_routes/slide_from_top.dart';
import 'package:screen_transitions/page_routes/zoom_in.dart';
import 'package:screen_transitions/page_routes/zoom_out.dart';

void main() => runApp(TransitionDemoApp());

class TransitionDemoApp extends StatelessWidget {
  const TransitionDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transition Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transitions = [
      {'name': 'Fade Transition', 'route': (page) => Fade(page: page)},
      {'name': 'Slide From Left', 'route': (page) => SlideFromLeft(page: page)},
      {'name': 'Slide From Right', 'route': (page) => SlideFromRight(page: page)},
      {'name': 'Slide From Bottom', 'route': (page) => SlideFromBottom(page: page)},
      {'name': 'Slide From Top', 'route': (page) => SlideFromTop(page: page)},
      {'name': 'Diagonal Slide', 'route': (page) => DiagonalSlide(page: page)},
      {'name': 'Cross Fade with Rotation Transition', 'route': (page) => CrossFade(page: page)},
      {'name': 'Zoom in Transition', 'route': (page) => ZoomIn(page: page)},
      {'name': 'Zoom out Transition', 'route': (page) => ZoomOut(page: page)},
      {'name': 'Center Zoom Transition', 'route': (page) => CenterZoom(page: page)},
      {'name': 'Scale Transition', 'route': (page) => ScaleRoute(page: page)},
      {'name': 'Rotate Transition', 'route': (page) => RotateRoute(page: page)},
      {'name': 'Flip Transition', 'route': (page) => FlipRoute(page: page)},
      {'name': 'Slide & Fade', 'route': (page) => SlideFadeRoute(page: page)},
      {'name': 'Custom Curve', 'route': (page) => CustomCurveRoute(page: page)},
      {'name': 'Circular Reveal', 'route': (page) => CircularRevealRoute(page: page)},
      {'name': 'Flip 3D', 'route': (page) => Flip3DRoute(page: page)},
      {'name': 'Elastic Transition', 'route': (page) => ElasticRoute(page: page)},
      {'name': 'Bounce Transition', 'route': (page) => BounceRoute(page: page)},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('15 Transition Animations')),
      body: ListView.builder(
        itemCount: transitions.length,
        itemBuilder: (context, index) {
          final transition = transitions[index];
          return ListTile(
            title: Text(transition['name'] as String),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                (transition['route'] as Function)(DetailsScreen(name: transition['name'] as String)),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String name;

  const DetailsScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Text(
          'This is the $name screen!',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}



class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
      return ScaleTransition(scale: scaleAnimation, child: child);
    },
  );
}


class RotateRoute extends PageRouteBuilder {
  final Widget page;

  RotateRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final rotateAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
      return RotationTransition(turns: rotateAnimation, child: child);
    },
  );
}

class FlipRoute extends PageRouteBuilder {
  final Widget page;

  FlipRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final rotateY = Tween(begin: 0.0, end: 1.0).animate(animation);
      return AnimatedBuilder(
        animation: rotateY,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationY(rotateY.value),
            alignment: Alignment.center,
            child: child,
          );
        },
        child: child,
      );
    },
  );
}

class SlideFadeRoute extends PageRouteBuilder {
  final Widget page;

  SlideFadeRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
          .animate(animation);
      final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);
      return SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(opacity: fadeAnimation, child: child),
      );
    },
  );
}

class CustomCurveRoute extends PageRouteBuilder {
  final Widget page;

  CustomCurveRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
      CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic);
      return FadeTransition(opacity: curvedAnimation, child: child);
    },
  );
}

class CircularRevealRoute extends PageRouteBuilder {
  final Widget page;

  CircularRevealRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: CircularRevealClipper(animation.value),
              child: child,
            ),
          ),
        ],
      );
    },
  );
}

class CircularRevealClipper extends CustomClipper<Path> {
  final double revealProgress;

  CircularRevealClipper(this.revealProgress);

  @override
  Path getClip(Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = revealProgress * size.longestSide;
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircularRevealClipper oldClipper) =>
      revealProgress != oldClipper.revealProgress;
}

class Flip3DRoute extends PageRouteBuilder {
  final Widget page;

  Flip3DRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animation);

      return AnimatedBuilder(
        animation: flipAnimation,
        builder: (context, child) {
          final isFront = flipAnimation.value < 0.5;
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(flipAnimation.value * 3.14159), // Rotate on Y-axis
            child: isFront ? child : page,
          );
        },
        child: child,
      );
    },
  );
}

class ElasticRoute extends PageRouteBuilder {
  final Widget page;

  ElasticRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final elasticAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.elasticOut,
      );

      return ScaleTransition(
        scale: elasticAnimation,
        child: child,
      );
    },
  );
}

class BounceRoute extends PageRouteBuilder {
  final Widget page;

  BounceRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final bounceAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.bounceOut,
      );

      return ScaleTransition(
        scale: bounceAnimation,
        child: child,
      );
    },
  );
}