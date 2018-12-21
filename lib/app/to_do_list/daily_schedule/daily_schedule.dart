import 'package:flutter/material.dart';
import 'daily_task.dart';
import 'column_data.dart';

class DailySchedule extends StatelessWidget {
  final List<ColumnData> dailyList;

  const DailySchedule({Key key, this.dailyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 11, top: 15),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dailyList.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext c, int i) =>
            DailyTask(cardData: dailyList[i]),
      ),
    );
  }
}