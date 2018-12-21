import 'package:firma_prototype/app/patients/patients_tab.dart';
import 'package:firma_prototype/app/visits/visits_tab.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'home_content.dart';
import '../to_do_list/to_do_list_tab.dart';

class Home extends StatelessWidget {
  final navigation = CupertinoTabBar(
    backgroundColor: Color.fromRGBO(249, 249, 249, 0.9),
    border: Border(
        top: BorderSide(width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.3))),
    inactiveColor: Color(0xFFBDBDBD),
    activeColor: Color(0xFF6F3E5D),
    iconSize: 26,
    currentIndex: 0,
    items: [
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
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: navigation,
      tabBuilder: (context, i) {
        switch (i) {
          case 0:
            return CupertinoTabView(builder: (BuildContext context) {
              return Container(
                color: CupertinoColors.white,
                child: HomeContent(
                  child: ToDoList(),
                ),
              );
            });
          case 1:
            return CupertinoTabView(builder: (BuildContext context) {
              return Container(
                color: CupertinoColors.white,
                child: HomeContent(
                  child: VisitsTab(),
                ),
              );
            });
          case 2:
            return CupertinoTabView(builder: (BuildContext context) {
              return Container(
                color: CupertinoColors.white,
                child: HomeContent(
                  child: PatientsTab(),
                ),
              );
            });
        }
        return null;
      },
    );
  }
}
