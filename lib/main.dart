import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'package:firma_prototype/home/to_do_list.dart';

import './login/login_screen.dart';
import './login/logo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/loginScreen": (BuildContext context) => LoginScreen(),
    "/toDoList": (BuildContext context) => ToDoList()
  };

  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = OutlineInputBorder(
      borderSide:
          BorderSide(color: Color(globals.color_common_purple), width: 1),
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
          labelStyle: TextStyle(
              color: Color(globals.color_common_purple), fontSize: 14),
          prefixStyle: TextStyle(color: Color(globals.color_common_purple)),
        ),
      ),
      routes: _routes,
    );
  }
}
