import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../accounts/accounts.dart';
import '../home/home.dart';
import '../notification/notification.dart';
import '../search/search.dart';


class Application extends StatefulWidget {
  const Application({
    Key? key,
    this.route,
  }) : super(key: key);
  final String? route;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List icons = [
    Icons.home_filled,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.bell_circle_fill,
    CupertinoIcons.person_fill
  ];
  List<String> pageName = [
    'Home Page',
    'Search Page',
    'Notification Page',
    'Account Page'
  ];
  int _currentPage = 0;

  double menuWidth = 256;

  bool isPressed = false;

  ThemeMode _themeMode=ThemeMode.system;

  @override
  void initState() {
    super.initState();

    if(widget.route=="/"){
      setState(() {
        _currentPage=0;
      });
    }
    else if(widget.route=="/search") {
      setState(() {
        _currentPage=1;
      });
    }else if(widget.route=="/notifications") {
      setState(() {
        _currentPage=2;
      });
    }else if(widget.route=="/accounts") {
      setState(() {
        _currentPage=3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: true,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 1.2,
          leading: IconButton(
            onPressed: () {
              if (MediaQuery.of(context).size.width <= 800) {
                _scaffoldKey.currentState?.openDrawer();
                setState(() {
                  menuWidth = 256;
                });
              } else {
                if (menuWidth == 256) {
                  setState(() {
                    menuWidth = 64;
                  });
                } else {
                  setState(() {
                    menuWidth = 256;
                  });
                }
              }
            },
            icon: const Icon(Icons.menu),
          ),
          title: const Text(
            "OrderIt",
          ),
        ),
        drawer: Drawer(
          child: myDrawer(),
        ),
        body: myBody(),
        bottomNavigationBar: MediaQuery.of(context).size.width <= 800
            ? Container(
          height: 60,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < icons.length; i++)
                  bottomNavBarItem(i, icons[i])
              ]),
        )
            : null,
      ),
    );
  }

  //yordamchi funksiyalar
  //body
  Widget myBody() {
    ThemeData theme=Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (MediaQuery.of(context).size.width > 800) myDrawer(),
        if (MediaQuery.of(context).size.width > 800)
          VerticalDivider(
            color: theme.dividerColor,
            thickness: 0.4,
          ),
        Flexible(
          child: IndexedStack(
            children: <Widget>[
              Home(),
              Search(),
              Notifications(),
              Accounts()
            ],
            index: _currentPage,
          ),
        ),
      ],
    );
  }

  //drawer
  Widget myDrawer() {
    ThemeData theme=Theme.of(context);
    return AnimatedContainer(
      width: menuWidth,
      duration: Duration(milliseconds: 256),
      child: ListView(
        shrinkWrap: true,
        children: [
          for (int i = 0; i < 4; i++)
            menuWidth == 256
                ? InkWell(
              onTap: () {
                if (kIsWeb) {
                  if (i == 0) {
                    Navigator.pushNamed(context, '/');
                  } else if (i == 1) {
                    Navigator.pushNamed(context, '/search');
                  } else if (i == 2) {
                    Navigator.pushNamed(context, '/notifications');
                  } else if (i == 3) {
                    Navigator.pushNamed(context, '/accounts');
                  }
                } else {
                  setState(() {
                    _currentPage = i;
                  });
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: ListView(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Icon(
                      icons[i],
                      color:
                      _currentPage == i ? theme.iconTheme.copyWith(
                          color: Colors.blue
                      ).color : theme.iconTheme.color,
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        pageName[i],
                        style: TextStyle(
                            color: _currentPage == i
                                ?theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.blue
                            ).color
                                : theme.textTheme.bodyMedium?.color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
                : Icon(
              icons[i],
              color: theme.iconTheme.color,
            ),
        ],
      ),
    );
  }

  //bottomNavBar
  Widget bottomNavBarItem(int i, icon) {
    ThemeData theme=Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          height: 2,
          width: 50,
          color: _currentPage == i ? theme.copyWith(cardColor: Colors.blue).cardColor: theme.cardColor,
        ),
        IconButton(
          onPressed: () => setState(() {
            _currentPage = i;
          }),
          icon: Icon(icon),
          color: _currentPage == i ?theme.iconTheme.copyWith(color: Colors.blue).color:theme.iconTheme.color,
        )
      ],
    );
  }


}
