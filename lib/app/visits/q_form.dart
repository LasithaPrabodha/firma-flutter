import 'package:flutter/cupertino.dart';
import '../../globals.dart' as globals;

class QForm extends StatefulWidget {
  @override
  _QForm createState() => _QForm();
}

class _QForm extends State<QForm> {
  int _checkVisit = -1;
  Widget highlightedQ(String text) {
    return Container(
      width: double.maxFinite,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(globals.color_common_purple),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    );
  }

  void _onChanged(int value) {
    setState(() {
      _checkVisit = value;
    });
  }

  List<Widget> makeRadios(labels) {
    List<Widget> list = new List<Widget>();

    for (int i = 1; i <= 2; i++) {
      var radioCard = Container(
        width: double.maxFinite,
        child: Row(
          children: <Widget>[
            Radio(
              value: i,
              groupValue: _checkVisit,
              onChanged: _onChanged,
              activeColor: Color(globals.color_common_purple),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              labels[i - 1],
              style: TextStyle(
                color: Color(globals.color_common_purple),
                fontSize: 14,
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
            ]),
        margin: EdgeInsets.only(bottom: 1),
      );
      list.add(radioCard);
    }
    return list;
  }

  Widget radionButtonSet() {
    const list = [
      '24 hour post dose',
      '48 hour post dose',
    ];
    return Container(
      child: Column(
        children: makeRadios(list).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 21.0),
      child: Container(
          padding: EdgeInsets.only(left: 24, right: 24, top: 18, bottom: 24),
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 22),
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
                  children: <Widget>[
                    highlightedQ('Check Visit (check one)'),
                    radionButtonSet()
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}
