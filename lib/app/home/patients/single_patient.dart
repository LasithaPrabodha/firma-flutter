import 'package:firma_prototype/app/common/cabin_text_style.dart';
import 'package:firma_prototype/app/home/patients/patients_tab.dart';
import 'package:firma_prototype/app/home/visits/single_patient_qtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firma_prototype/globals.dart' as globals;

class SinglePatient extends StatelessWidget {
  final PatientData data;
  final bool isVisit;
  final int visitID;

  const SinglePatient(
      {Key key, this.data, this.isVisit = false, this.visitID = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _handleTap() {
      if (isVisit)
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (BuildContext context) {
            return SinglePatientQtn(
                patientName: data.patientName, visitID: visitID);
          }),
        );
    }

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
        title:  CabinBoldTextStyle(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data.patientName.toString(),
                style: TextStyle(
                  color: Color(globals.color_common_purple),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                data.age.toString() + ' Years',
                style: TextStyle(
                  color: Color(globals.color_common_purple),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Last Visit " + data.lastVisit.toString(),
                style: TextStyle(
                  color: Color.fromRGBO(111, 62, 93, 0.62),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              isVisit
                  ? Text(
                      "Visit " + visitID.toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(111, 62, 93, 0.62),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      children: <Widget>[
                        Text(
                          "Progress ",
                          style: TextStyle(
                            color: Color.fromRGBO(111, 62, 93, 0.62),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            _createProgress(data.progress),
                            _createRest(10 - data.progress)
                          ].expand((x) => x).toList(),
                        ),
                      ],
                    )
            ],
          ),
        ),
        trailing: CircleAvatar(
          radius: 32,
          backgroundImage: ExactAssetImage(
              'assets/images/' + data.patientImg.toString() + '.png'),
        ),
        onTap: _handleTap,
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
            border: Border.all(color: Color.fromRGBO(111, 62, 93, 0.62))),
      );
    });
  }
}
