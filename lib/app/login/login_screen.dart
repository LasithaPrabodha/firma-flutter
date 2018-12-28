import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import './login_form.dart';
import '../../globals.dart' as globals;

// place: "/loginScreen"
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //Logo
    var decoratedBox = DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/firma_logo.png'),
        ),
      ),
    );

    var hero = GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: 'firma',
        child: decoratedBox,
      ),
    );

    var column = Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            // color: Colors.blueAccent,
            alignment: Alignment(0, 0.7),
            child: Container(
              height: 150,
              width: 150,
              child: hero,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            // color: Colors.cyanAccent,
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: LoginForm(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // color: Colors.amberAccent,
            padding: new EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      color: Color(globals.color_text_grey), fontSize: 14),
                ),
                CupertinoButton(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Color(globals.color_common_purple),
                        fontSize: 14),
                  ),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );

    var layout = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: column,
          ),
        ),
      );
    });

    return CupertinoPageScaffold(
      child: DefaultTextStyle(
        style: TextStyle(fontFamily: "CabinBold"),
        child: layout,
      ),
    );
  }
}
