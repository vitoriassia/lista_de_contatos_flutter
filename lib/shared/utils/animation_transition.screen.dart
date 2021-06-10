import 'package:flutter/material.dart';

class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: animation.drive(Tween<Offset>(
              begin: const Offset(-0.5, 0.0),
              end: const Offset(0.0, 0.0),
            ).chain(CurveTween(curve: Curves.ease))),
            child: child,
          ),
        );
}
