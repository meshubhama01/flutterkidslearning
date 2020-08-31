import 'package:flutter/material.dart';
import 'package:kid_learn/main.dart';
import 'package:kid_learn/screen/alphaPractiseScreen.dart';
import 'package:kid_learn/screen/testorpractise.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  static bool alpha;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  child: Text("ALPHABETS"),
                  color: Colors.white,
                  onPressed: () {
                    HomeScreen.alpha = true;
                    setState(() {
                      Navigator.pushNamed(context, TestorPractise.id);
                    });
                  },
                ),
                FlatButton(
                  child: Text("Numbers"),
                  color: Colors.white,
                  onPressed: () {
                    HomeScreen.alpha = false;
                    setState(() {
                      Navigator.pushNamed(context, TestorPractise.id);
                    });
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
