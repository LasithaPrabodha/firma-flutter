import 'package:firma_prototype/history_limit.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'app/_tab_navigator/home_screen.dart';

import 'app/login/login_screen.dart';
import 'app/login/logo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/loginScreen": (BuildContext context) => LoginScreen(),
    "/home": (BuildContext context) => Home(),
  };

  @override
  Widget build(BuildContext context) {
    // final outLineInputBorder = OutlineInputBorder(
    //   borderSide:
    //       BorderSide(color: Color(globals.color_common_purple), width: 1),
    //   borderRadius: BorderRadius.circular(2),
    // );
    return CupertinoApp(
      title: 'Firma',
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),
      navigatorObservers: [HistoryLimit(5)],
      // theme: ThemeData(
      //   inputDecorationTheme: InputDecorationTheme(
      //     border: outLineInputBorder,
      //     enabledBorder: outLineInputBorder,
      //     focusedBorder: outLineInputBorder,
      //     labelStyle: TextStyle(
      //         color: Color(globals.color_common_purple), fontSize: 14),
      //     prefixStyle: TextStyle(color: Color(globals.color_common_purple)),
      //   ),
      // ),
      initialRoute: '/loginScreen',
      routes: _routes,
    );
  }
}
