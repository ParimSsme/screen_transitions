import 'package:flutter/material.dart';
import 'package:screen_transitions/page_routes/accordion.dart';
import 'package:screen_transitions/page_routes/blur_to_clear.dart';
import 'package:screen_transitions/page_routes/bounce_ball.dart';
import 'package:screen_transitions/page_routes/bounce_with_rotation.dart';
import 'package:screen_transitions/page_routes/center_zoom.dart';
import 'package:screen_transitions/page_routes/checker_board.dart';
import 'package:screen_transitions/page_routes/circular_reveal.dart';
import 'package:screen_transitions/page_routes/cross_fade.dart';
import 'package:screen_transitions/page_routes/curl_page.dart';
import 'package:screen_transitions/page_routes/curved_reveal.dart';
import 'package:screen_transitions/page_routes/diagonal_slide.dart';
import 'package:screen_transitions/page_routes/diagonal_wipe.dart';
import 'package:screen_transitions/page_routes/elastic.dart';
import 'package:screen_transitions/page_routes/fade.dart';
import 'package:screen_transitions/page_routes/flip_3d_horizontal.dart';
import 'package:screen_transitions/page_routes/flip_3d_vertical.dart';
import 'package:screen_transitions/page_routes/flip_horizontal.dart';
import 'package:screen_transitions/page_routes/flip_vertical.dart';
import 'package:screen_transitions/page_routes/fragmented_explode.dart';
import 'package:screen_transitions/page_routes/gaussian_blur.dart';
import 'package:screen_transitions/page_routes/icon_morph.dart';
import 'package:screen_transitions/page_routes/page_flip_1.dart';
import 'package:screen_transitions/page_routes/page_flip_2.dart';
import 'package:screen_transitions/page_routes/parallax_zoom.dart';
import 'package:screen_transitions/page_routes/path_morph.dart';
import 'package:screen_transitions/page_routes/ripple1.dart';
import 'package:screen_transitions/page_routes/ripple2.dart';
import 'package:screen_transitions/page_routes/rotate.dart';
import 'package:screen_transitions/page_routes/scale_rotate.dart';
import 'package:screen_transitions/page_routes/shape_morph.dart';
import 'package:screen_transitions/page_routes/slide_fade.dart';
import 'package:screen_transitions/page_routes/slide_from_bottom.dart';
import 'package:screen_transitions/page_routes/slide_from_left.dart';
import 'package:screen_transitions/page_routes/slide_from_right.dart';
import 'package:screen_transitions/page_routes/slide_from_top.dart';
import 'package:screen_transitions/page_routes/slide_scale_fade.dart';
import 'package:screen_transitions/page_routes/sliding_panels.dart';
import 'package:screen_transitions/page_routes/spiral.dart';
import 'package:screen_transitions/page_routes/spring.dart';
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
      theme: ThemeData(
        cardTheme: const CardTheme(color: Colors.black45),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final transitions = [
    {'name': 'Fade Transition', 'route': (page) => Fade(page: page)},
    {'name': 'Slide From Left', 'route': (page) => SlideFromLeft(page: page)},
    {'name': 'Slide From Right', 'route': (page) => SlideFromRight(page: page)},
    {
      'name': 'Slide From Bottom',
      'route': (page) => SlideFromBottom(page: page)
    },
    {'name': 'Slide From Top', 'route': (page) => SlideFromTop(page: page)},
    {'name': 'Diagonal Slide', 'route': (page) => DiagonalSlide(page: page)},
    {
      'name': 'Cross Fade with Rotation Transition',
      'route': (page) => CrossFade(page: page)
    },
    {'name': 'Zoom in Transition', 'route': (page) => ZoomIn(page: page)},
    {'name': 'Zoom out Transition', 'route': (page) => ZoomOut(page: page)},
    {
      'name': 'Center Zoom Transition',
      'route': (page) => CenterZoom(page: page)
    },
    {'name': 'Rotate Transition', 'route': (page) => Rotate(page: page)},
    {
      'name': 'Flip Horizontal Transition',
      'route': (page) => FlipHorizontal(page: page)
    },
    {
      'name': 'Flip Vertical Transition',
      'route': (page) => FlipVertical(page: page)
    },
    {'name': 'Slide Fade Transition', 'route': (page) => SlideFade(page: page)},
    {
      'name': 'Scale Rotate Transition',
      'route': (page) => ScaleRotate(page: page)
    },
    {
      'name': 'Slide Scale Fade Transition',
      'route': (page) => SlideScaleFade(page: page)
    },
    {'name': 'Elastic Transition', 'route': (page) => Elastic(page: page)},
    {
      'name': 'Complex Icon Morph Transition',
      'route': (page) => ComplexIconMorph(page: page, iconData: Icons.star)
    },
    {
      'name': 'Shape Morph Transition',
      'route': (page) => ShapeMorph(page: page)
    },
    {
      'name': 'Fragmented Explode Transition',
      'route': (page) => FragmentedExplode(page: page)
    },
    {
      'name': 'Gaussian Blur Transition',
      'route': (page) => GaussianBlur(page: page)
    },
    {
      'name': 'Blur to Clear Transition',
      'route': (page) => BlurToClear(page: page)
    },
    {
      'name': 'Parallax Zoom Transition',
      'route': (page) => ParallaxZoom(page: page)
    },
    {
      'name': 'Circular Reveal Transition',
      'route': (page) => CircularReveal(page: page)
    },
    {
      'name': 'Bounce with Rotation Transition',
      'route': (page) => BounceWithRotation(page: page)
    },
    {
      'name': 'Flip 3D Vertical Transition',
      'route': (page) => Flip3dVertical(page: page)
    },
    {
      'name': 'Flip 3D Horizontal Transition',
      'route': (page) => Flip3dHorizontal(page: page)
    },
    {'name': 'Path Morph Transition', 'route': (page) => PathMorph(page: page)},
    {'name': 'Spring Transition', 'route': (page) => Spring(page: page)},
    {'name': 'Ripple 1 Transition', 'route': (page) => Ripple1(page: page)},
    {'name': 'Ripple 2 Transition', 'route': (page) => Ripple2(page: page)},
    {
      'name': 'Page Flip 1 Transition',
      'route': (page) => PageFlip1(page: page)
    },
    {
      'name': 'Page Flip 2 Transition',
      'route': (page) => PageFlip2(page: page)
    },
    {'name': 'Curl Transition', 'route': (page) => CurlPage(page: page)},
    {'name': 'Accordion Transition', 'route': (page) => Accordion(page: page)},
    {'name': 'Spiral Transition', 'route': (page) => Spiral(page: page)},
    {
      'name': 'Diagonal Wipe Transition',
      'route': (page) => DiagonalWipe(page: page)
    },
    {
      'name': 'Sliding Panels Transition',
      'route': (page) => SlidingPanels(page: page)
    },
    {
      'name': 'Curved Reveal Transition',
      'route': (page) => CurvedReveal(page: page)
    },
    {
      'name': 'Checker Board Transition',
      'route': (page) => CheckerBoard(page: page)
    },{
      'name': 'Bounce Ball Transition',
      'route': (page) => BounceBall(page: page)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('${transitions.length} Transition Animations')),
      body: ListView.separated(
        itemCount: transitions.length,
        itemBuilder: (context, index) {
          final transition = transitions[index];
          return GestureDetector(
            onTap: () {
              if (context.mounted) {
                Navigator.push(
                  context,
                  (transition['route'] as Function)(
                      DetailsScreen(name: transition['name'] as String)),
                );
              }
            },
            child: _ListItem(
              name: transition['name'] as String,
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String name;
  const _ListItem({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
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
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
        title: Text(name),
      ),
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
