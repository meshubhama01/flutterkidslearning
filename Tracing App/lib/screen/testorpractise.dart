import 'package:flutter/material.dart';
import 'package:kid_learn/main.dart';
import 'package:kid_learn/screen/alphaPractiseScreen.dart';
import 'package:kid_learn/screen/alphaTestScreen.dart';
import 'package:kid_learn/screen/homeScreen.dart';
import 'package:kid_learn/screen/numPractiseScreen.dart';
import 'package:kid_learn/screen/numTestScreen.dart';

class TestorPractise extends StatefulWidget {
  static const String id = 'testorpractise_screen';
  @override
  _TestorPractiseState createState() => _TestorPractiseState();
}

class _TestorPractiseState extends State<TestorPractise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text("Practise"),
                  color: Colors.white,
                  onPressed: () {
                    if (HomeScreen.alpha == true) {
                      setState(() {
                        Navigator.pushNamed(context, AlphaPractiseScreen.id);
                      });
                    }
                    if (HomeScreen.alpha == false) {
                      setState(() {
                        Navigator.pushNamed(context, NumPractiseScreen.id);
                      });
                    }
                  },
                ),
                FlatButton(
                  child: Text("Test"),
                  color: Colors.white,
                  onPressed: () {
                    if (HomeScreen.alpha == true) {
                      setState(() {
                        Navigator.pushNamed(context, AlphaTestScreen.id);
                      });
                    }
                    if (HomeScreen.alpha == false) {
                      setState(() {
                        Navigator.pushNamed(context, NumTestScreen.id);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
