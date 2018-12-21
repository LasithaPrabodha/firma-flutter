import 'package:firma_prototype/app/_tab_navigator/home_content.dart';
import 'package:firma_prototype/app/visits/single_visit.dart';
import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class VisitData {
  final int visit;
  final String date;
  final int patients;
  final int completedAmount;

  VisitData({this.visit, this.date, this.patients, this.completedAmount});
}

class VisitsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VisitsTabState();
}

class _VisitsTabState extends State<VisitsTab> {
  final List<VisitData> visitData = [
    VisitData(visit: 1, date: '14 Dec 2018', patients: 5, completedAmount: 5),
    VisitData(visit: 2, date: '16 Dec 2018', patients: 5, completedAmount: 2),
    VisitData(visit: 3, date: '17 Dec 2018', patients: 5, completedAmount: 0),
    VisitData(visit: 4, date: '18 Dec 2018', patients: 5, completedAmount: 0),
    VisitData(visit: 5, date: '19 Dec 2018', patients: 5, completedAmount: 0),
    VisitData(visit: 6, date: '20 Dec 2018', patients: 5, completedAmount: 0)
  ];

  int activeVisit = -1;

  @override
  Widget build(BuildContext context) {
    void _setActiveVisit(visitID) {
      setState(() {
        // If the lake is currently favorited, unfavorite it.
        activeVisit = visitID;
      });

      Navigator.push(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation<double> animation, Animation<double> secondaryAnimation) {
          return HomeContent(child: Container());
        }),
      );
    }

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 21.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Visits',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'CabinBold',
                color: Color(globals.color_common_purple),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 28, right: 28, bottom: 42),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: visitData.map((item) {
                return SingleVisit(data: item, onChanged: _setActiveVisit);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}