import 'package:firma_prototype/app/patients/patients_tab.dart';
import 'package:firma_prototype/app/visits/visits_tab.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'home_content.dart';
import '../to_do_list/to_do_list_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> toDoNaviKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> visitsNaviKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> patientsNaviKey = GlobalKey<NavigatorState>();

  Widget tabBuilder(BuildContext context, int i) {
    switch (i) {
      case 0:
        return CupertinoTabView(
            navigatorKey: toDoNaviKey,
            builder: (BuildContext context) {
              return HomeContent(
                child: ToDoList(),
              );
            });
      case 1:
        return CupertinoTabView(
            navigatorKey: visitsNaviKey,
            builder: (BuildContext context) {
              return HomeContent(
                child: VisitsTab(),
              );
            });
      case 2:
        return CupertinoTabView(
            navigatorKey: patientsNaviKey,
            builder: (BuildContext context) {
              return HomeContent(
                child: PatientsTab(),
              );
            });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final tabBar = CupertinoTabBar(
      backgroundColor: Color.fromRGBO(249, 249, 249, 0.9),
      border: Border(
        top: BorderSide(width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.3)),
      ),
      inactiveColor: Color(0xFFBDBDBD),
      activeColor: Color(0xFF6F3E5D),
      iconSize: 26,
      currentIndex: 0,
      onTap: (int i) {
        if (_currentIndex == i) {
          if (i == 0) toDoNaviKey.currentState.popUntil((r) => r.isFirst);
          if (i == 1) visitsNaviKey.currentState.popUntil((r) => r.isFirst);
        }

        setState(() {
          _currentIndex = i;
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(OMIcons.eventNote),
          ),
          title: Text('To Do List'),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(OMIcons.filterNone),
          ),
          title: Text('Visits'),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(OMIcons.peopleOutline),
          ),
          title: Text('Patients'),
        )
      ],
    );

    return WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      onWillPop: () => Future<bool>.value(true),
      child: SafeArea(
        top: false,
        child: CupertinoTabScaffold(
          tabBar: tabBar,
          tabBuilder: tabBuilder,
        ),
      ),
    );
  }
}
