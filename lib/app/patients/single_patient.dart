import 'package:firma_prototype/app/patients/patients_tab.dart';
import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class SinglePatient extends StatelessWidget {
  final PatientData data;

  const SinglePatient({Key key, this.data}) : super(key: key);

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
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data.patientName.toString(),
              style: TextStyle(
                  color: Color(globals.color_common_purple),
                  fontFamily: "CabinBold",
                  fontSize: 14),
            ),
            Text(
              data.age.toString() + 'Years',
              style: TextStyle(
                  color: Color(globals.color_common_purple),
                  fontFamily: "CabinBold",
                  fontSize: 12),
            ),
            Text(
              "Last Visit " + data.lastVisit.toString(),
              style: TextStyle(
                  color: Color.fromRGBO(111, 62, 93, 0.62),
                  fontFamily: "CabinBold",
                  fontSize: 12),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    "Progress",
                    style: TextStyle(
                        color: Color.fromRGBO(111, 62, 93, 0.62),
                        fontFamily: "CabinBold",
                        fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      _createProgress(data.progress),
                      _createRest(10 - data.progress)
                    ].expand((x) => x).toList(),
                  ),
                )
              ],
            )
          ],
        ),
        trailing: CircleAvatar(
          radius: 32,
          backgroundImage: ExactAssetImage(
              'assets/images/' + data.patientImg.toString() + '.png'),
        ),
      ),
    );
  }

  Iterable<int> gerateRange(end) sync* {
    int i = 0;
    while (i < end) yield i++;
  }

  Iterable<Widget> _createProgress(count) {
    return gerateRange(count).map((item) {
      return Container(
        margin: EdgeInsets.only(top: 2, right: 2),
        height: 3,
        width: 8,
        decoration: ShapeDecoration(
            color: Color(0xFF27AE60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
      );
    });
  }

  Iterable<Widget> _createRest(count) {
    return gerateRange(count).map((item) {
      return Container(
        margin: EdgeInsets.only(top: 2, right: 2),
        height: 3,
        width: 8,
        decoration: BoxDecoration(
          color: Color(0x00000000),
          borderRadius: BorderRadius.circular(1),
          border: Border.all(color: Color.fromRGBO(111, 62, 93, 0.62))
        ),
      );
    });
  }
}
