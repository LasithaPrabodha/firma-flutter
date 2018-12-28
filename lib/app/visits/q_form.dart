import 'package:firma_prototype/app/visits/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../globals.dart' as globals;

class QForm extends StatefulWidget {
  @override
  _QForm createState() => _QForm();
}

class _QForm extends State<QForm> {
  int _checkVisit = -1;
  DateTime date, time;

  @override
  Widget build(BuildContext context) {
    const list1 = [
      '24 hour post dose',
      '48 hour post dose',
    ];
    const list2 = [
      'Yes',
      'No (If "No" Comment)',
    ];
    const list3 = [
      'No',
      'Yes (if "Yes" Contact Investigator site and list below)',
    ];
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 60),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              'Patient Questionnaire',
              style: TextStyle(
                color: Color(globals.color_common_purple),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _greyContainer(
                  child: Column(
                    children: <Widget>[
                      _highlightedQ('Check Visit (check one)'),
                      _radionButtonSet(list1)
                    ],
                  ),
                ),
                _normalContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Blood Sample Collection',
                          style: TextStyle(
                            color: Color(globals.color_common_purple),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _highlightedQ(
                          'A1. Was the pharmacokinetic (pk) samplecollected & prosessed per protocol?'),
                      _radionButtonSet(list2),
                      _commentBox()
                    ],
                  ),
                ),
                _normalContainer(
                  child: Column(
                    children: <Widget>[
                      _highlightedQ(
                          'A2. Please provide exact date and time of collection'),
                      _inputWithLabel(
                          type: 'date', label: 'Date of collection'),
                      _inputWithLabel(type: 'time', label: 'Time of collection')
                    ],
                  ),
                ),
                _normalContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _highlightedQ(
                          'A3. Document the courier name and tracking number for the blood sample'),
                      _inputWithLabel(type: 'text', label: 'Courier Name'),
                      _inputWithLabel(type: 'num', label: 'Tracking Number')
                    ],
                  ),
                ),
                _greyContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          'Assessment Of Changes In Health And Medicaton',
                          style: TextStyle(
                            color: Color(globals.color_common_purple),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _highlightedQ(
                          'B1. Did the subject report (unslicited) any changes in health or medication during the visit?'),
                      _radionButtonSet(list3),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'a. Name of individual contacted',
                              style: TextStyle(
                                color: Color(globals.color_common_purple),
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 3,
                                  child: Text(
                                    'at the Site ',
                                    style: TextStyle(
                                      color: Color(globals.color_common_purple),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 7,
                                  child: _inputField(
                                      keyboardType: TextInputType.multiline),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        _inputWithLabel(
                                            type: 'date',
                                            label: 'Date',
                                            flex1: 3,
                                            flex2: 7),
                                        _inputWithLabel(
                                            type: 'time',
                                            label: 'Time',
                                            flex1: 3,
                                            flex2: 7)
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'b. Describe any symptoms as reported by the patient',
                              style: TextStyle(
                                color: Color(globals.color_common_purple),
                                fontSize: 14,
                              ),
                            ),
                            _commentBox()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                _normalContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text(
                        'Remote Visit service\nProvider Signature',
                        style: TextStyle(
                          color: Color(globals.color_common_purple),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _inputWithLabel(
                        type: 'text', label: 'RVSP Full Name', maxLines: 2),
                    _inputWithLabel(type: 'date', label: 'Date')
                  ],
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: CupertinoButton(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 14),
              ),
              onPressed: () {},
              borderRadius: BorderRadius.circular(1),
              padding: EdgeInsets.symmetric(horizontal: 84, vertical: 8),
              color: Color(globals.color_common_purple),
            ),
          )
        ],
      ),
    );
  }

  Widget _commentBox() {
    return Container(
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
        ],
      ),
      margin: EdgeInsets.only(top: 14),
      child: CupertinoTextField(
        keyboardType: TextInputType.multiline,
        placeholder: 'Comment',
        maxLines: 4,
        style: TextStyle(
          fontFamily: "CabinBold",
          color: Color(globals.color_common_purple),
        ),
      ),
    );
  }

  Widget _greyContainer({Widget child}) {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFF2F2F2)),
            top: BorderSide(width: 1, color: Color(0xFFF2F2F2)),
          ),
          color: Color(0xFF799C4C).withOpacity(0.04),
        ),
        child: child);
  }

  Widget _normalContainer({Widget child}) {
    return Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
        child: child);
  }

  Widget _highlightedQ(String text) {
    return Container(
      width: double.maxFinite,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(globals.color_common_purple),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    );
  }

  Widget _radionButtonSet(list) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Column(
        children: _makeRadios(list).toList(),
      ),
    );
  }

  List<Widget> _makeRadios(List labels) {
    List<Widget> list = new List<Widget>();
    void _onChanged(int value) {
      setState(() {
        _checkVisit = value;
      });
    }

    for (int i = 1; i <= labels.length; i++) {
      var radioCard = Container(
        width: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: i,
              groupValue: _checkVisit,
              onChanged: _onChanged,
              activeColor: Color(globals.color_common_purple),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  labels[i - 1],
                  style: TextStyle(
                      color: Color(globals.color_common_purple), fontSize: 14),
                ),
              ),
            )
          ],
        ),
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
          ],
        ),
        margin: EdgeInsets.only(bottom: 1),
      );
      list.add(radioCard);
    }
    return list;
  }

  Widget _inputWithLabel(
      {String type, String label, int flex1 = 1, int flex2 = 1, int maxLines}) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 6),
      child: Row(
        crossAxisAlignment: maxLines != null && maxLines > 1
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: flex1,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Color(globals.color_common_purple).withOpacity(0.8),
              ),
            ),
          ),
          Expanded(
            flex: flex2,
            child: type == 'date'
                ? DateTimePicker.buildDatePicker(context, date,
                    (DateTime newDateTime) {
                    setState(() => date = newDateTime);
                  })
                : type == 'time'
                    ? DateTimePicker.buildTimePicker(context, time,
                        (DateTime newDateTime) {
                        setState(() => time = newDateTime);
                      })
                    : _inputField(
                        keyboardType: type == 'num'
                            ? TextInputType.number
                            : TextInputType.multiline,
                        maxLines: maxLines),
          )
        ],
      ),
    );
  }

  Widget _inputField({TextInputType keyboardType, int maxLines}) {
    return CupertinoTextField(
      maxLines: maxLines,
      decoration: BoxDecoration(
        border:
            Border.all(color: Color.fromRGBO(111, 62, 93, 0.62), width: 0.5),
        borderRadius: BorderRadius.circular(1),
      ),
      style: TextStyle(fontSize: 14, color: Color(globals.color_common_purple)),
      keyboardType: keyboardType,
    );
  }
}
