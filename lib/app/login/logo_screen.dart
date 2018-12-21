import 'package:flutter/cupertino.dart';
import 'login_screen.dart';

/// place: "/"
class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  Widget build(BuildContext context) {
    void _onPressed() {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return LoginScreen();
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
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
      // Navigator.pushNamed(context, "/loginScreen");
    }

    // llama Image
    var decoratedBox = DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/firma_logo.png'),
        ),
      ),
    );

    // hero top left
    var hero = GestureDetector(
      onTap: _onPressed,
      child: Hero(
        tag: 'firma',
        child: decoratedBox,
      ),
    );

    return CupertinoPageScaffold(
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
  }
}
