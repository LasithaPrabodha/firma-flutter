import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'daily_schedule/daily_schedule.dart';
import 'daily_schedule/column_data.dart';

class DayItem {
  final DateTime day;
  final List schedule;

  DayItem({this.day, this.schedule});
}

class WeeklyList extends StatelessWidget {
  final _list = [
    DayItem(
      day: new DateTime.now(),
      schedule: <ColumnData>[
        ColumnData(
          from: '9.30 am',
          to: '11.30 am',
          patient: 'Clara Eve',
          visit: 'visit 1',
          done: true,
        ),
        ColumnData(
          from: '1.30 am',
          to: '2.30 am',
          patient: 'Henry Jackson',
          visit: 'visit 1',
          done: true,
        ),
        ColumnData(
          from: '3.00 am',
          to: '4.30 am',
          patient: 'Calvin Abel',
          visit: 'visit 1',
          done: false,
        ),
        ColumnData(
          from: '5.15 am',
          to: '6.00 am',
          patient: 'Daisy Beverly',
          visit: 'visit 1',
          done: false,
        ),
      ],
    ),
    DayItem(
      day: new DateTime.now().add(Duration(days: 1)),
      schedule: <ColumnData>[
        ColumnData(
          from: '9.30 am',
          to: '11.30 am',
          patient: 'Clara Eve',
          visit: 'visit 1',
          done: false,
        ),
        ColumnData(
          from: '1.30 am',
          to: '2.30 am',
          patient: 'Henry Jackson',
          visit: 'visit 1',
          done: false,
        ),
        ColumnData(
          from: '3.00 am',
          to: '4.30 am',
          patient: 'Calvin Abel',
          visit: 'visit 1',
          done: false,
        ),
        ColumnData(
          from: '5.15 am',
          to: '6.00 am',
          patient: 'Daisy Beverly',
          visit: 'visit 1',
          done: false,
        ),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _list.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctxt, int i) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    new DateFormat('EEEE').format(_list[i].day),
                    style: TextStyle(
                      color: i == 0 ? Color(0xFF6F3E5D) : Color.fromRGBO(111, 62, 93, 0.62),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 1,
                      color: Color.fromRGBO(111, 62, 93, 0.62),
                    ),
                  ),
                ],
              ),
              DailySchedule(dailyList: _list[i].schedule)
            ],
          );
        },
      ),
    );
  }
}
