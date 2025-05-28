import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatelessWidget {
  const PulsatingCircleAnimation({super.key});

  final double size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pulsating Circle Animation')),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 2000),
          tween: Tween<double>(begin: 0, end: 200),
          builder: (context, object, child) {
            return Container(
              width: object,
              height: object,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
              child: child,
            );
          },
          child: Container(width: 200, height: 200, color: Colors.red),
        ),
      ),
    );
  }
}
