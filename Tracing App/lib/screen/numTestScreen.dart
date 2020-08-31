import 'package:flutter/material.dart';
import 'package:kid_learn/main.dart';

class NumTestScreen extends StatefulWidget {
  static const String id = 'numtest_screen';
  @override
  _NumTestScreenState createState() => _NumTestScreenState();
}

class _NumTestScreenState extends State<NumTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
            child: Column(
          children: [Center(child: Text("Test area for model2"))],
        )),
      ),
    );
  }
}
