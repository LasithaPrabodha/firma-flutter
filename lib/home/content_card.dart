import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import '../globals.dart' as globals;

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      margin: const EdgeInsets.all(21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 600,
            padding: EdgeInsets.all(12),
            child: Column(children: <Widget>[
              Text(
                'To Do List',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'CabinBold',
                    color: Color(globals.color_common_purple)),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
