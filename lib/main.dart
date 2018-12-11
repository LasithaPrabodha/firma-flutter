import 'package:flutter/material.dart';
import 'globals.dart' as globals;


import './login/login_screen.dart';
import './login/logo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/loginScreen": (BuildContext context) => LoginScreen(),
  };

  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Color(globals.color_common_purple), width: 2),
      borderRadius: BorderRadius.circular(2),
    );
    return MaterialApp(
      title: 'Firma',
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: outLineInputBorder,
          enabledBorder: outLineInputBorder,
          focusedBorder: outLineInputBorder,
          labelStyle: TextStyle(color: Color(globals.color_common_purple), fontSize: 14),
          prefixStyle: TextStyle(color: Color(globals.color_common_purple)),
        ),
      ),
      routes: _routes,
    );
  }
}
