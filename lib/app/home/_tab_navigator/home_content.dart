import 'package:firma_prototype/app/common/cabin_text_style.dart';
import 'package:firma_prototype/app/common/card_layout.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
// import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final Widget child;
  const HomeContent({this.child});

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
              child: bigOval(width: MediaQuery.of(context).size.width + 50),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 30.0),
              child: Column(
                children: <Widget>[
                  _textRow(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: CardLayout(child: child),
                    ),
                  ),
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
      padding: const EdgeInsets.only(left: 21, right: 21, bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 24,
                ),
              ),
              Text(
                'Silvia Erin',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 32,
                ),
              ),
              Text(
                'Wednesday, 14th of Dec',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 12,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(
                OMIcons.menu,
                color: CupertinoColors.white,
              )
            ],
          )
        ],
      ),
    );
  }

  static Widget bigOval({double width}) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(152 / 360),
      alignment: Alignment(0.05, -0.2),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.elliptical(width, 250.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2C051E), Color(0xFFAD5389)],
          ),
        ),
      ),
    );
  }
}
