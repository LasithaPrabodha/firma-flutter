import 'package:firma_prototype/app/to_do_list/daily_schedule/tick_icon.dart';
import 'package:firma_prototype/app/visits/visits_tab.dart';
import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class SingleVisit extends StatelessWidget {
  final VisitData data;
  final ValueChanged<int> onChanged;

  const SingleVisit({Key key, this.data, @required this.onChanged})
      : super(key: key);

  void _handleTap() {
    onChanged(data.visit);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              blurRadius: 2,
            )
          ]),
      child: ListTile(
        onTap: _handleTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Visit " + data.visit.toString(),
              style: TextStyle(
                color: Color(globals.color_common_purple),
                fontWeight: FontWeight.bold,
                fontFamily: "CabinBold",
                fontSize: 16,
              ),
            ),
            data.completedAmount < data.patients
                ? Text(
                    data.date.toString(),
                    style: TextStyle(
                      color: Color(globals.color_common_purple),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  )
                : Text(
                    'Done by ' + data.date.toString(),
                    style: TextStyle(
                      color: Color(0xFF27AE60),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
            Text(
              data.patients.toString() + " Patients",
              style: TextStyle(
                color: Color.fromRGBO(111, 62, 93, 0.62),
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            )
          ],
        ),
        trailing: data.completedAmount < data.patients
            ? Text(
                data.completedAmount.toString() +
                    "/" +
                    data.patients.toString(),
                style: TextStyle(
                    color: Color.fromRGBO(111, 62, 93, 0.62),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: "CabinBold"),
              )
            : TickIcon(),
      ),
    );
  }
}