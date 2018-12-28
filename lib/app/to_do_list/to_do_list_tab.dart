import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'horizontal_timeline.dart';
import 'weekly_list.dart';

import '../../globals.dart' as globals;

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(children: <Widget>[
            Text(
              'To Do List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(globals.color_common_purple),
              ),
            )
          ]),
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HorizontalTimeline(),
              WeeklyList(),
            ],
          ),
        )
      ],
    );
  }
}
