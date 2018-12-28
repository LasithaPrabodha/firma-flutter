import 'package:firma_prototype/app/patients/patients_tab.dart';
import 'package:firma_prototype/app/patients/single_patient.dart';
import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class SingleVisitPatients extends StatelessWidget {
  final int visitID;
  SingleVisitPatients({Key key, @required this.visitID}) : super(key: key);

  final List<PatientData> patientData = [
    PatientData(
      age: 34,
      patientName: "Clara Eve",
      lastVisit: '01 Dec 2018',
      progress: 2,
      patientImg: 'avatar1',
    ),
    PatientData(
      age: 51,
      patientName: "Henry Jackson",
      lastVisit: '01 Dec 2018',
      progress: 3,
      patientImg: 'avatar2',
    ),
    PatientData(
      age: 31,
      patientName: "Calvin Abel",
      lastVisit: '01 Dec 2018',
      progress: 2,
      patientImg: 'avatar3',
    ),
    PatientData(
      age: 47,
      patientName: "Abbie Dee",
      lastVisit: '01 Dec 2018',
      progress: 1,
      patientImg: 'avatar1',
    ),
    PatientData(
      age: 45,
      patientName: "Daisy Beverly",
      lastVisit: '01 Dec 2018',
      progress: 1,
      patientImg: 'avatar2',
    ),
    PatientData(
      age: 34,
      patientName: "Clara Eve",
      lastVisit: '01 Dec 2018',
      progress: 2,
      patientImg: 'avatar3',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            'Visit ' + visitID.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(globals.color_common_purple),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 28, right: 28, bottom: 42),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: patientData.map<Widget>((item) {
              return SinglePatient(data: item, isVisit: true, visitID: visitID);
            }).toList(),
          ),
        )
      ],
    );
  }
}
