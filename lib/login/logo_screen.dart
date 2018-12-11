import 'package:flutter/material.dart';

/// place: "/"
class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      Navigator.of(context).pushNamed("/loginScreen");
    }

    // llama Image
    var decoratedBox = DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/firma_logo.jpg'),
        ),
      ),
    );

    // hero top left
    var hero = GestureDetector(
      onTap: _onPressed,
      child: Hero(
        tag: 'firma',
        child: decoratedBox,
      ),
    );

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.4,
          heightFactor: 0.4,
          child: Container(
            child: hero,
          ),
        ),
      ),
    );
  }
}
