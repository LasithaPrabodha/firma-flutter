import 'package:flutter/material.dart';

class CabinBoldTextStyle extends StatelessWidget {
  final Widget child;
  CabinBoldTextStyle({this.child});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontFamily: "CabinBold",
      ),
      child: child,
    );
  }
}
