import 'dart:async';

import 'package:firma_prototype/app/_services/authentication.dart';
import 'package:firma_prototype/app/home/_tab_navigator/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login_screen.dart';

/// place: "/"
class LogoScreen extends StatefulWidget {
  final BaseAuth auth;

  LogoScreen({this.auth});

  @override
  _LogoScreenState createState() => _LogoScreenState();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _LogoScreenState extends State<LogoScreen> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        } else {
          _timer = new Timer(const Duration(milliseconds: 1000), () {
            _navigateToForm();
          });
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _navigateToForm() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) {
          return LoginScreen(auth: new Auth());
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // llama Image
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

    var logo = CupertinoPageScaffold(
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.4,
          heightFactor: 0.4,
          child: Container(
            child: hero,
          ),
        ),
      ),
    );
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return logo;
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return new Home();
        } else
          return logo;

        break;
      default:
        return logo;
    }
  }
}
