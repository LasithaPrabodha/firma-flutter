import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidate: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'User ID',
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.person,
                    color: Color(globals.color_common_purple)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(Icons.vpn_key,
                    color: Color(globals.color_common_purple)),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
            ),
            ButtonTheme(
              minWidth: double.infinity,
              buttonColor: Color(globals.color_common_purple),
              child: RaisedButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                padding: EdgeInsets.all(14),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Forgot ",
                    style: TextStyle(color: Color(globals.color_text_grey)),
                  ),
                  GestureDetector(
                    child: Text(
                      "Password",
                      style:
                          TextStyle(color: Color(globals.color_common_purple)),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
