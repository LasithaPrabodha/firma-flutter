import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date {
  final String day;
  final String weekDay;
  final bool isToday;

  Date({this.day, this.weekDay, this.isToday});
}

class HorizontalTimeline extends StatelessWidget {
  final now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFFF2F2F2),
            height: 46,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    DateFormat('MMM').format(now),
                    style: TextStyle(
                      color: Color.fromRGBO(111, 62, 93, 0.62),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _dates(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Iterable<Widget> _dates() {
    Date _generateDate(date) {
      if (date > 0) {
        var incrementedDate = now.add(Duration(days: date));
        var weekDay = new DateFormat('E').format(incrementedDate);
        return Date(
            day: incrementedDate.day.toString(),
            weekDay: weekDay,
            isToday: false);
      } else if (date == 0) {
        var weekDay = new DateFormat('E').format(now);
        return Date(day: now.day.toString(), weekDay: weekDay, isToday: true);
      } else {
        var decrementedDate = now.add(Duration(days: date));
        var weekDay = new DateFormat('E').format(decrementedDate);
        return Date(
            day: decrementedDate.day.toString(),
            weekDay: weekDay,
            isToday: false);
      }
    }

    List<Date> dates = [
      _generateDate(-2),
      _generateDate(-1),
      _generateDate(0),
      _generateDate(1),
      _generateDate(2),
      _generateDate(3),
    ];

    return dates.map<Widget>((item) {
      return item.isToday
          ? Container(
              padding: EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: 16,
                top: 5,
              ),
              decoration: BoxDecoration(
                color: Color(0xFF6F3E5D),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(100, 0, 0, 0),
                    offset: Offset(0, 4),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    item.weekDay,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    item.day,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.only(
                bottom: 0,
                top: 5,
              ),
              decoration: BoxDecoration(
                color: Color(0x00000000),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(3),
                  bottomRight: Radius.circular(3),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    item.weekDay,
                    style: TextStyle(
                      color: Color.fromRGBO(111, 62, 93, 0.62),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    item.day,
                    style: TextStyle(
                      color: Color.fromRGBO(111, 62, 93, 0.62),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            );
    }).toList();
  }
}
