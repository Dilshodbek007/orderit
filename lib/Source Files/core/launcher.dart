

import 'package:flutter/material.dart';
import 'package:orderit/Source%20Files/core/application.dart';
import 'package:orderit/Source%20Files/core/router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';




class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  static ThemeData darkTheme=ThemeData(
    selectedRowColor: Colors.red,
    appBarTheme: AppBarTheme(
      color: Colors.black45,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
          color: Colors.white
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    iconTheme:IconThemeData(
      color: Colors.grey,
    ),
    backgroundColor: Colors.black45,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.white54
    ),
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.white54,
      ),
      iconColor: Colors.white54,
    ),
    cardColor: Colors.white,
    dividerColor: Colors.white70,

  );

  static ThemeData lightTheme=ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            color: Colors.black
        ),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
        iconColor: Colors.grey,
        hintStyle: TextStyle(
            color: Colors.grey
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black87
        ),
      ),
      cardColor: Colors.white,
      dividerColor: Colors.grey
  );

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {

  String theme = "light";
  final ThemeMode _themeMode=ThemeMode.system;

  get darkTheme => Launcher.darkTheme;
  get lightTheme => Launcher.lightTheme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrderIt',
      themeMode: _themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
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