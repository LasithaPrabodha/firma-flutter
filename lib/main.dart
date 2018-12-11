import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _routes = <String, WidgetBuilder>{
    "/anotherPage": (BuildContext context) => new AnotherPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Firma',
      home: new MyHomePage(),
      routes: _routes,
    );
  }
}

/// place: "/"
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // llama Image
    var decoratedBox = new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/firma_logo.jpg'),
        ),
      ),
    );

    // hero top left
    var hero = new Hero(
      tag: 'hero-tag-llama',
      child: decoratedBox,
    );

    return new Scaffold(
      body: new Center(
        child: Container(
          height: 100,
          width: 100,
          child: hero,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressed,
        tooltip: 'Increment',
        child: new Icon(Icons.done),
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).pushNamed("/anotherPage");
  }
}

// place: "/anotherPage"
class AnotherPage extends StatefulWidget {
  @override
  _AnotherPageState createState() => new _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    // llama Image
    var decoratedBox = new DecoratedBox(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage('assets/images/firma_logo.jpg'),
      )),
    );

    // hero center
    var hero = new Hero(
      tag: 'hero-tag-llama',
      child: decoratedBox,
    );

    var center = new Center(
      child: new Container(
        height: 200.0,
        width: 200.0,
        child: hero,
      ),
    );

    return new Scaffold(
      body: center,
    );
  }
}
