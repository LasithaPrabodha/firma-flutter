import 'package:flutter/cupertino.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import '../../globals.dart' as globals;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    void _onSubmit() {
      // Navigator.of(context).push(CupertinoPageRoute<void>(
      //     builder: (BuildContext context) => Home()));
      Navigator.pushReplacementNamed(context, '/home');
    }

    return Container(
      child: Form(
        autovalidate: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupertinoTextField(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(globals.color_common_purple), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(
                    OMIcons.personOutline,
                    color: Color(globals.color_common_purple),
                  ),
                ),
                style: TextStyle(fontSize: 14, color: CupertinoColors.black),
                placeholder: 'User ID',
                padding: EdgeInsets.all(10),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupertinoTextField(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(globals.color_common_purple), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                style: TextStyle(fontSize: 14, color: CupertinoColors.black),
                prefix: Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(
                    OMIcons.vpnKey,
                    color: Color(globals.color_common_purple),
                  ),
                ),
                placeholder: 'Password',
                padding: EdgeInsets.all(10),
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CupertinoButton(
                color: Color(globals.color_common_purple),
                onPressed: _onSubmit,
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            CupertinoButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Forgot ',
                    style: TextStyle(
                      color: Color(globals.color_text_grey),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      color: Color(globals.color_common_purple),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
