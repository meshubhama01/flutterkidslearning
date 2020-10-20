import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
// import 'package:kid_learn/main.dart';

List numbersLUT = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

int _cursor = 0;
AudioCache audioPlayer;
Random rand = Random();

class NumPractiseScreen extends StatefulWidget {
  static const String id = 'numPractise_screen';
  @override
  _NumPractiseScreenState createState() => _NumPractiseScreenState();
}

class _NumPractiseScreenState extends State<NumPractiseScreen> {
  DrawingController controller;

  @override
  void initState() {
    controller = new DrawingController();
    audioPlayer = AudioCache();
    _cursor = rand.nextInt(10);
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
                        "Numbers Practice",
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
                          numbersLUT[_cursor],
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
                  onPressed: () async {
                    await audioPlayer.play('button3.mp3');
                    setState(() {
                      _cursor = rand.nextInt(10);
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
