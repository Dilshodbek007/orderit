

import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;

  RouteTransition({this.widget, this.routeName})
      : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return widget!;
    },
    transitionDuration: const Duration(milliseconds: 0),
    reverseTransitionDuration: const Duration(milliseconds: 0),
    transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
        ) {
      var begin = Offset.zero;
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}