import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoScreen extends StatefulWidget {
  @override
  LogoScreenState createState() => LogoScreenState();

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: FractionallySizedBox(
  //         heightFactor: 0.4,
  //         widthFactor: 0.4,
  //         child: GestureDetector(
  //           onTap: () {

  //           },
  //           child: Image.asset(
  //             'assets/images/firma_logo.jpg',
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class LogoScreenState extends State<LogoScreen>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LogoAnimation(
      animation: animation,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class LogoAnimation extends AnimatedWidget {
  LogoAnimation({Key key, Animation animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: Image.asset(
          'assets/images/firma_logo.jpg',
        ),
      ),
    );
  }
}