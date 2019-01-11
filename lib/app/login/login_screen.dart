import 'package:firma_prototype/app/common/cabin_text_style.dart';
import 'package:firma_prototype/app/_services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firma_prototype/globals.dart' as globals;
import 'dart:async';

import 'package:firma_prototype/app/_utils/network_util.dart';
import 'package:firma_prototype/app/_utils/validators.dart';

import 'package:outline_material_icons/outline_material_icons.dart';

// place: "/loginScreen"
class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth});

  final BaseAuth auth;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController, _passwordController;
  final http = new NetworkUtil();

//  final _storage = new FlutterSecureStorage();

//  final JsonDecoder _decoder = new JsonDecoder();

  String _errorMessage;

  bool _isIos;
  bool _isLoading;

  final purple = globals.color_common_purple;
  bool isFormValid = true;
  Future post;

  @override
  void initState() {
    super.initState();
    _errorMessage = "";
    _isLoading = false;
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
//    readStorage.then((value) {
//      if (value != null) print(value.completed);
//    });
  }

  @override
  void dispose() {
    _errorMessage = "";
    _isLoading = false;
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() async {
    if (_validate() && !_isLoading) {
      setState(() {
        _errorMessage = "";
        _isLoading = true;
      });
      String userId = "";
      try {
        userId = await widget.auth
            .signIn(_emailController.text, _passwordController.text);
        print('Signed in: $userId');

        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          _errorMessage =
              "Email password combination incorrect. Please try again...";
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

//  void _storeData(key, value) async {
//    var jsonData = json.encode(value);
//    await _storage.write(key: key, value: jsonData);
//  }

  Widget _loginFormInputBox(
      {TextEditingController controller, String placeholder, bool isEmail}) {
    return CupertinoTextField(
      controller: controller,
      padding: EdgeInsets.all(10),
      prefix: Padding(
        padding: EdgeInsets.only(left: 14),
        child: Icon(
          isEmail ? OMIcons.personOutline : OMIcons.vpnKey,
          color: Color(purple),
        ),
      ),
      placeholder: placeholder,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Color(purple), width: 1),
      ),
      style: TextStyle(fontSize: 14, color: CupertinoColors.black),
      obscureText: !isEmail,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
    );
  }

  bool _validate() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty)
      return false;
    else if (!Validators.emailValidator(_emailController))
      return false;
    else if (_passwordController.text.length < 6) {
      return false;
    }
    return true;
  }

//  Future<LoginItem> get readStorage async {
//    String userData = await _storage.read(key: 'userLoginData');
//    if (userData != null) {
//      return LoginItem.fromJson(_decoder.convert(userData));
//    } else {
//      return null;
//    }
//  }

  Widget _showCircularProgressOrButton() {
    if (_isLoading) {
      return CupertinoActivityIndicator(
        animating: true,
        radius: 9.5,
      );
    }
    return Text(
      'Sign In',
      style: TextStyle(fontSize: 16, fontFamily: "CabinBold"),
    );
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != "") {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _loginForm(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: _loginFormInputBox(
                controller: _emailController,
                placeholder: "User ID",
                isEmail: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: _loginFormInputBox(
                controller: _passwordController,
                placeholder: "Password",
                isEmail: false,
              ),
            ),
            _showErrorMessage(),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CupertinoButton(
                color: Color(purple),
                borderRadius: BorderRadius.circular(2),
                onPressed: _validateAndSubmit,
                pressedOpacity: 0.5,
                child: _showCircularProgressOrButton(),
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
                        fontFamily: "CabinBold"),
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Color(purple),
                        fontSize: 14,
                        fontFamily: "CabinBold"),
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

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    var decoratedBox = DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/firma_logo.png'),
        ),
      ),
    );

    // hero top left
    var hero = Hero(
      tag: 'firma',
      child: decoratedBox,
    );
    //Logo
    Widget column = Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Container(
            // color: Colors.blueAccent,
            alignment: Alignment(0, 0.7),
            child: Container(height: 150, width: 150, child: hero),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
              // color: Colors.cyanAccent,
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: _loginForm(context)),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Color(globals.color_text_grey),
                    fontSize: 14,
                  ),
                ),
                CupertinoButton(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color(globals.color_common_purple),
                      fontSize: 14,
                      fontFamily: "CabinBold",
                    ),
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

    Widget layout = LayoutBuilder(
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
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: CabinBoldTextStyle(
          child: layout,
        ),
      ),
    );
  }
}
