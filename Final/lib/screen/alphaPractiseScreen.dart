import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
// import 'package:kid_learn/main.dart';

List alphabetsLUT = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  "W",
  "X",
  'Y',
  'Z'
];

int _cursor = 0;

Random rand = Random();

class AlphaPractiseScreen extends StatefulWidget {
  static const String id = 'alphapractise_screen';
  @override
  _AlphaPractiseScreenState createState() => _AlphaPractiseScreenState();
}

class _AlphaPractiseScreenState extends State<AlphaPractiseScreen> {
  DrawingController controller;

  @override
  void initState() {
    controller = new DrawingController();

    _cursor = rand.nextInt(26);
    super.initState();
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to end practice?'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("NO"),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(true);
                  Navigator.of(context).pop(true);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("YES"),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Color(0XFFffb347),
        body: Container(
          alignment: Alignment.center,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Color(0xFFffaa1d),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () async {
                            await _onBackPressed();
                          }),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "Alphabets Practice",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  width: 500,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          alphabetsLUT[_cursor],
                          style: TextStyle(fontSize: 240),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Opacity(
                          opacity: 0.5,
                          child: Whiteboard(
                            controller: controller,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  color: Color(0xFF6f4e37),
                  onPressed: () {
                    setState(() {
                      _cursor = rand.nextInt(26);
                      controller.wipe();
                    });
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
