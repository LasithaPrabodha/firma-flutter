// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firma_prototype/home/home_content.dart';

class ToDoList extends StatelessWidget {
  final layout = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: IntrinsicHeight(child: HomeContent(height: 188.0)),
      ),
    );
  });

  final navigation = BottomNavigationBar(
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: new Icon(Icons.home),
        title: new Text('To Do List'),
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.mail),
        title: new Text('Visits'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile'),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: layout, bottomNavigationBar: navigation);
  }
}
