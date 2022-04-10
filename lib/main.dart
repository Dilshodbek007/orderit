
import 'package:flutter/material.dart';

import 'pages/custom_nav_bar1.dart';

void main() {
  runApp(const MyApp());
}

class TransitionRoute extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;

  TransitionRoute({this.widget, this.routeName})
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return TransitionRoute(
            widget: const CustomNavBar1(),
            routeName: settings.name,
          );
        } else if (settings.name == '/search') {
          return TransitionRoute(
            widget:  CustomNavBar1(
              route: settings.name,
            ),
            routeName: settings.name
          );
        } else if (settings.name == '/notification') {
          return TransitionRoute(
            widget: CustomNavBar1(
              route: settings.name,
            ),
            routeName: settings.name,
          );
        } else if (settings.name == '/account') {
          return TransitionRoute(
            widget: CustomNavBar1(
              route: settings.name,
            ),
            routeName: settings.name,
          );
        }
      },
    );
  }
}
