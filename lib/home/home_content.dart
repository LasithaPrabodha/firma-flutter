import 'package:firma_prototype/home/content_card.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final double height;

  const HomeContent({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xFF6F3E5D),
          height: height,
          width: double.infinity,
          child: _bigOval(width: MediaQuery.of(context).size.width + 50),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30.0),
          child: Column(
            children: <Widget>[
              _textRow(),
              Expanded(
                child: ContentCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21),
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
                    color: Colors.white, fontSize: 24, fontFamily: 'CabinBold'),
              ),
              Text(
                'Silvia Erin',
                style: TextStyle(
                    color: Colors.white, fontSize: 32, fontFamily: 'CabinBold'),
              ),
              Text(
                'Wednesday, 14th of Dec',
                style: TextStyle(
                    color: Colors.white, fontSize: 12, fontFamily: 'CabinBold'),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(
                Icons.menu,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _bigOval({double width}) {
    return RotationTransition(
      turns: new AlwaysStoppedAnimation(152 / 360),
      alignment: Alignment(0.05, -0.14),
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
