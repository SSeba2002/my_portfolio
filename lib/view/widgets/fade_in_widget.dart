import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class FadeInWidget extends StatelessWidget {
  final Widget child;
  const FadeInWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return FadeScaleTransition(
      animation: CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.easeInOut,
      ),
      child: child,
    );
  }
}