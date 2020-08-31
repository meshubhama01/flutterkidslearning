import 'package:flutter/material.dart';
import 'package:kid_learn/main.dart';

class AlphaTestScreen extends StatefulWidget {
  static const String id = 'alphatest_screen';
  @override
  _AlphaTestScreenState createState() => _AlphaTestScreenState();
}

class _AlphaTestScreenState extends State<AlphaTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [Center(child: Text("Test area for Model1"))],
          ),
        ),
      ),
    );
  }
}
