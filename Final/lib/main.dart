import 'package:flutter/material.dart';
import 'package:kid_learn/screen/testorpractise.dart';
import 'screen/Introscreen.dart';
import 'screen/homeScreen.dart';
import 'screen/alphaTestScreen.dart';
import 'screen/alphaPractiseScreen.dart';
import 'screen/numPractiseScreen.dart';
import 'screen/numTestScreen.dart';

void main() => runApp(Kidlearn());

class Kidlearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: IntroScreen.id,
      routes: {
        IntroScreen.id: (context) => IntroScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        TestorPractise.id: (context) => TestorPractise(),
        AlphaTestScreen.id: (context) => AlphaTestScreen(),
        AlphaPractiseScreen.id: (context) => AlphaPractiseScreen(),
        NumTestScreen.id: (context) => NumTestScreen(),
        NumPractiseScreen.id: (context) => NumPractiseScreen(),
      },
    );
  }
}
