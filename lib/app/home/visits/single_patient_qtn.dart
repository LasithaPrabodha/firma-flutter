import 'package:firma_prototype/app/common/cabin_text_style.dart';
import 'package:firma_prototype/app/home/_tab_navigator/home_content.dart';
import 'package:firma_prototype/app/common/card_layout.dart';
import 'package:firma_prototype/app/home/visits/q_form.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class SinglePatientQtn extends StatefulWidget {
  final String patientName;
  final int visitID;

  SinglePatientQtn({Key key, @required this.patientName, this.visitID})
      : super(key: key);

  @override
  _SinglePatientQtnState createState() => _SinglePatientQtnState();
}

class _SinglePatientQtnState extends State<SinglePatientQtn> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CabinBoldTextStyle(
        child: Stack(
          children: <Widget>[
            Container(
              color: Color(0xFF6F3E5D),
              height: 188,
              width: double.infinity,
              child: HomeContent.bigOval(
                  width: MediaQuery.of(context).size.width + 50),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Padding(
                      child: Icon(
                        OMIcons.arrowBackIos,
                        color: CupertinoColors.white,
                        size: 20,
                      ),
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _textRow(),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: CardLayout(child: QForm()),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.patientName,
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "Visit " + widget.visitID.toString(),
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                'Wednesday, 14th of Dec',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 10,
                ),
              ),
              Text(
                'ID M 3216549874634987',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
