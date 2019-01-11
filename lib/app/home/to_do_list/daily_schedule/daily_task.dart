import 'dart:math';
import 'package:firma_prototype/app/common/cabin_text_style.dart';
import 'package:firma_prototype/app/home/visits/single_patient_qtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'column_data.dart';
import 'tick_icon.dart';

class DailyTask extends StatelessWidget {
  final ColumnData cardData;
  const DailyTask({Key key, this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onTapHandle() {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (BuildContext context) {
          return SinglePatientQtn(
              patientName: cardData.patient, visitID: cardData.visit);
        }),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 4),
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
        onTap: _onTapHandle,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          child: cardData.done
              ? TickIcon()
              : Icon(
                  Icons.radio_button_unchecked,
                  color: Color(0xFFE0E0E0),
                ),
        ),
        title: CabinBoldTextStyle(
          child: Row(
            children: <Widget>[
              Expanded(
                child: _singleColumn(
                    isLeft: true,
                    data: ColumnData(
                      from: cardData.from,
                      to: cardData.to,
                    )),
              ),
              Expanded(
                child: _singleColumn(
                    isLeft: false,
                    data: ColumnData(
                      patient: cardData.patient,
                      visit: cardData.visit,
                    )),
              ),
            ],
          ),
        ),
        trailing: CircleAvatar(
          backgroundImage: ExactAssetImage(
              'assets/images/' + cardData.img + '.png'),
        ),
      ),
    );
  }

  Widget _singleColumn({bool isLeft, ColumnData data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        isLeft
            ? Text(
                data.from,
                style: TextStyle(
                  color: Color(0xFF6F3E5D),
                  fontSize: 12,
                ),
              )
            : Row(
                children: <Widget>[
                  Container(
                    height: 4.0,
                    width: 4.0,
                    margin: EdgeInsets.only(right: 4),
                    decoration: new BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      data.patient,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xFF6F3E5D),
                          fontSize: 12,
                          fontFamily: "CabinBold"),
                    ),
                  )
                ],
              ),
        Padding(
          padding: EdgeInsets.only(left: isLeft ? 0 : 8),
          child: Text(
            isLeft ? data.to : 'visit ' + data.visit.toString(),
            style: TextStyle(
              color: Color.fromRGBO(111, 62, 93, 0.62),
              fontSize: isLeft ? 12 : 10,
            ),
          ),
        )
      ],
    );
  }
}
