import 'package:firma_prototype/app/_services/authentication.dart';
import 'package:firma_prototype/history_limit.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:firma_prototype/app/home/_tab_navigator/home_screen.dart';

import 'package:firma_prototype/app/login/login_screen.dart';
import 'package:firma_prototype/app/login/logo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/loginScreen": (BuildContext context) => LoginScreen(),
    "/home": (BuildContext context) => Home(),
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Firma',
      debugShowCheckedModeBanner: false,
      home: LogoScreen(auth: new Auth()),
      navigatorObservers: [HistoryLimit(10)],
      // theme: ThemeData(
      // inputDecorationTheme: InputDecorationTheme(
      //   border: outLineInputBorder,
      //   enabledBorder: outLineInputBorder,
      //   focusedBorder: outLineInputBorder,
      // labelStyle: TextStyle(
      //   color: Color(globals.color_common_purple),
      //   fontSize: 14,
      //   fontFamily: "CabinBold",
      // ),
      //   prefixStyle: TextStyle(color: Color(globals.color_common_purple)),
      // ),
      //   fontFamily: "CabinBold",
      // ),
      routes: _routes,
    );
  }
}
