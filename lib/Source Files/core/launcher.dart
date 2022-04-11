

import 'package:flutter/material.dart';
import 'package:orderit/Source%20Files/core/application.dart';
import 'package:orderit/Source%20Files/core/router.dart';




class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
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
          return RouteTransition(
            widget: const Application(),
            routeName: settings.name,
          );
        } else if (settings.name == '/search') {
          return RouteTransition(
              widget:  Application(
                route: settings.name,
              ),
              routeName: settings.name
          );
        } else if (settings.name == '/notifications') {
          return RouteTransition(
            widget: Application(
              route: settings.name,
            ),
            routeName: settings.name,
          );
        } else if (settings.name == '/accounts') {
          return RouteTransition(
            widget: Application(
              route: settings.name,
            ),
            routeName: settings.name,
          );
        }
      },
    );
  }
}