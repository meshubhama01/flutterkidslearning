import 'package:flutter/material.dart';
// import 'package:kid_learn/main.dart';

class AlphaPractiseScreen extends StatefulWidget {
  static const String id = 'alphapractise_screen';
  @override
  _AlphaPractiseScreenState createState() => _AlphaPractiseScreenState();
}

class _AlphaPractiseScreenState extends State<AlphaPractiseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
            child: Column(
          children: [Center(child: Text("practise area for model1"))],
        )),
      ),
    );
  }
}
