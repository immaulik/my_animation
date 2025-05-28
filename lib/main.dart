import 'package:flutter/material.dart';
import 'package:my_animation/implicit_examples/animated_color_pallete.dart'
    show AnimatedColorPalette;
import 'package:my_animation/implicit_examples/animated_shopping_cart_button.dart';
import 'package:my_animation/page_route_builder_animation/splash_animation.dart';

import 'custom_painter_example/bouncing_ball_animation.dart';
import 'explicit_examples/list_animation.dart' show ListAnimation;
import 'explicit_examples/loading_animation.dart' show RadialProgressAnimation;
import 'explicit_examples/login_animation.dart';
import 'implicit_examples/animated_tween_animation_builder_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BouncingBallAnimation(),
    );
  }
}
