

import 'package:flutter/material.dart';
import 'package:orderit/Source%20Files/core/application.dart';
import 'package:orderit/Source%20Files/core/router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';




class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {

  String theme = "light";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrderIt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>Application()
      },
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
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const Scaffold(
            body: Text("Unknown page"),
          ),
        );
      },
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        minWidth: 400,
        //maxWidth: 1200,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(
            400,
            name: MOBILE,
          ),
          const ResponsiveBreakpoint.resize(
            480,
            name: TABLET,
          ),
          const ResponsiveBreakpoint.resize(
            768,
            name: "Tablets portrait mode",
          ),
          const ResponsiveBreakpoint.resize(
            1024,
            name: DESKTOP,
          ),
          const ResponsiveBreakpoint.resize(
            1280,
            name: "Large screen",
          ),
          const ResponsiveBreakpoint.autoScale(
            2460,
            name: "Large screen infinite",
          ),
        ],
        background: Container(
          color: theme == "light" ? Colors.white : Colors.grey[900],
        ),
      ),
    );
  }
}