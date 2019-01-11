import 'package:flutter/material.dart';

class TickIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Positioned(
        //   top: 1.0,
        //   left: 1.0,
        //   child: Icon(
        //     Icons.check_circle_outline,
        //     color: Color.fromRGBO(0, 0, 0, 0.25),
        //   ),
        // ),
        // BackdropFilter(
        //   filter: new ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        //   child: Icon(
        //     Icons.check_circle_outline,
        //     color: Color(0xFF27AE60),
        //   ),
        // ),
        Icon(
            Icons.check_circle_outline,
            color: Color(0xFF27AE60),
          )
      ],
    );
  }
}