import 'package:flutter/material.dart';
// import 'package:kid_learn/main.dart';

class NumPractiseScreen extends StatefulWidget {
  static const String id = 'numPractise_screen';
  @override
  _NumPractiseScreenState createState() => _NumPractiseScreenState();
}

class _NumPractiseScreenState extends State<NumPractiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
            child: Column(
          children: [Center(child: Text("practise area for model2"))],
        )),
      ),
    );
  }
}
