import 'package:flutter/material.dart';
import './login_form.dart';
import '../globals.dart' as globals;

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
          image: AssetImage('assets/images/firma_logo.jpg'),
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
          flex: 12,
          child: Container(
            alignment: Alignment(0, 0.6),
            child: Container(
              height: 150,
              width: 150,
              child: hero,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: LoginForm(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: new EdgeInsets.all(14),
            height: 48.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account",
                  style: TextStyle(color: Color(globals.color_text_grey)),
                ),
                ButtonTheme(
                  minWidth: double.minPositive,
                  child: OutlineButton(
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(color: Color(globals.color_common_purple)),
                    ),
                    borderSide: BorderSide(style: BorderStyle.none),
                    padding: EdgeInsets.all(0),
                    onPressed: () => {},
                  ),
                )
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

    return Scaffold(body: layout);
  }
}
