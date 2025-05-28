import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    animation = Tween<double>(begin: 1, end: 10).animate(controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.forward().then((value) {
              Navigator.of(context)
                  .push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Destination();
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final tween = Tween(
                              begin: Offset(0, -1),
                              end: Offset.zero,
                            ).animate(animation);
                            return SlideTransition(
                              position: tween,
                              child: child,
                            );
                          },
                    ),
                  )
                  .then((value) {
                    controller.reset();
                  });
            });
          },
          child: ScaleTransition(
            scale: animation,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Text('Go Back')),
    );
  }
}
