import 'package:firma_prototype/app/common/cabin_text_style.dart';
import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  final Widget child;
  CardLayout({this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 21.0),
      child: CabinBoldTextStyle(
        child: child,
      ),
    );
  }
}
