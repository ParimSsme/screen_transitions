import 'package:flutter/material.dart';
import 'package:screen_transitions/route_transitions/cross_fade_route.dart';
import 'package:screen_transitions/route_transitions/diagonal_slide_route.dart';
import 'package:screen_transitions/route_transitions/fade_route.dart';
import 'package:screen_transitions/route_transitions/slide_from_bottom_route.dart';
import 'package:screen_transitions/route_transitions/slide_from_left_route.dart';
import 'package:screen_transitions/route_transitions/slide_from_right_route.dart';
import 'package:screen_transitions/route_transitions/slide_from_top_route.dart';
import 'package:screen_transitions/route_transitions/zoom_in_route.dart';
import 'package:screen_transitions/route_transitions/zoom_out_route.dart';

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
      {'name': 'Fade Transition', 'route': (page) => FadeRoute(page: page)},
      {'name': 'Slide From Left', 'route': (page) => SlideFromLeftRoute(page: page)},
      {'name': 'Slide From Right', 'route': (page) => SlideFromRightRoute(page: page)},
      {'name': 'Slide From Bottom', 'route': (page) => SlideFromBottomRoute(page: page)},
      {'name': 'Slide From Top', 'route': (page) => SlideFromTopRoute(page: page)},
      {'name': 'Diagonal Slide', 'route': (page) => DiagonalSlideRoute(page: page)},
      {'name': 'Cross Fade with Rotation Transition', 'route': (page) => CrossFadeRoute(page: page)},
      {'name': 'Zoom in Transition', 'route': (page) => ZoomInRoute(page: page)},
      {'name': 'Zoom out Transition', 'route': (page) => ZoomOutPageRoute(page: page)},
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