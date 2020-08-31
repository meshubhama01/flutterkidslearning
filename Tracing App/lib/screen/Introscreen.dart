import 'package:flutter/material.dart';
import 'package:kid_learn/main.dart';
import 'package:kid_learn/screen/homeScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class IntroScreen extends StatefulWidget {
  static const String id = 'intro_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomeScreen(),
      title: Text('design me please'),
    );
  }
}
