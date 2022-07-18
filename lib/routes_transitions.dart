import 'package:flutter/material.dart';

class ScalingPageRoute extends PageRouteBuilder {
  final Widget navigateTo;

  ScalingPageRoute({required this.navigateTo})
      : super(
          pageBuilder: (context, _, __) => navigateTo,
          transitionsBuilder: (context, animation, _, child) => ScaleTransition(
            scale: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          ),
        );
}

class FadePageRoute extends PageRouteBuilder {
  final Widget navigateTo;
  FadePageRoute({required this.navigateTo})
      : super(
          pageBuilder: (context, _, __) => navigateTo,
          transitionsBuilder: (context, animation, _, child) => FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 500),
        );
}
