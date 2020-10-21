import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../alert.dart';
import 'package:kid_learn/Models/predictions.dart';
import 'package:kid_learn/drawing_painter.dart';
import 'package:kid_learn/recognizer.dart';
import 'package:kid_learn/constants.dart';

class NumTestScreen extends StatefulWidget {
  static const String id = 'numtest_screen';
  @override
  _NumTestScreenState createState() => _NumTestScreenState();
}

class _NumTestScreenState extends State<NumTestScreen> {
  final _points = List<Offset>();
  final _recognizer = Recognizer();
  List<Prediction> _prediction = [];
  bool initialize = false;
  Random _rand = Random();
  int _randNumber = 0;
  List numbersLUT = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  FlutterTts flutterTts = FlutterTts();
  AudioCache audioPlayer;

  setLanguage() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setSpeechRate(1.0);
  }

  speak(String character) async {
    var result = await flutterTts.speak("Write, $character");
    print(result);
  }

  @override
  void initState() {
    super.initState();
    _initModel();
    setLanguage();
    _randNumber = _rand.nextInt(10);
    speak(numbersLUT[_randNumber]);
    audioPlayer = AudioCache();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Numbers Test'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                ' Write :-       " ${numbersLUT[_randNumber]} "',
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 32),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 10,
          ),
          _drawCanvasWidget(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.12),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow[300],
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(22.0)),
                padding: EdgeInsets.only(
                    top: 10.0, right: 10.0, left: 10.0, bottom: 20.0),
                margin: EdgeInsets.only(right: 45.0),
                width: MediaQuery.of(context).size.width * 0.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.replay,
                        color: Colors.black54,
                        size: 45.0,
                      ),
                      onPressed: () async {
                        await audioPlayer.play('button3.mp3');
                        if (_prediction != null) {
                          _prediction.clear();
                        }
                        if (_points != null) {
                          _points.clear();
                        }
                        _randNumber = _rand.nextInt(10);

                        setState(() {});
                        await speak(numbersLUT[_randNumber]);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 48.0,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        await audioPlayer.play('button3.mp3');
                        try {
                          if (_prediction != null) {
                            _prediction.clear();
                          }
                          if (_points != null) {
                            _points.clear();
                          }
                        } catch (e) {
                          print("error : $e");
                        }
                        setState(() {});
                      },
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(),
                          borderRadius: BorderRadius.circular(18.0)),
                      elevation: 0.8,
                      color: Colors.yellow[300],
                      child: Text(
                        "Check",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () async {
                        await audioPlayer.play('button3.mp3');
                        var predList = await _recognize();
                        if (predList[0]['label'] == numbersLUT[_randNumber] &&
                            predList[0]['confidence'] > 0.50) {
                          audioPlayer.play('success.mp3');

                          var p =
                              await testPopup(context, "Well Done !", 'next');
                          if (p == true) {
                            setState(() {
                              if (_prediction != null) {
                                _prediction.clear();
                              }
                              if (_points != null) {
                                _points.clear();
                              }
                            });
                            await Future.delayed(Duration(seconds: 1));
                            await speak(numbersLUT[_randNumber]);
                          } else if (p == false) {
                            if (_prediction != null) {
                              _prediction.clear();
                            }
                            if (_points != null) {
                              _points.clear();
                            }
                            setState(() {
                              _randNumber = _rand.nextInt(10);
                            });
                            await Future.delayed(Duration(seconds: 1));
                            await speak(numbersLUT[_randNumber]);
                          }
                        } else {
                          audioPlayer.play('fail.mp3');
                          var p =
                              await testPopup(context, "Try Again!", 'redo');
                          if (p == true) {
                            setState(() {
                              if (_prediction != null) {
                                _prediction.clear();
                              }
                              if (_points != null) {
                                _points.clear();
                              }
                            });
                            await Future.delayed(Duration(milliseconds: 500));
                            await speak(numbersLUT[_randNumber]);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawCanvasWidget() {
    return Container(
      width: Constants.canvasSize + Constants.borderSize * 2,
      height: Constants.canvasSize + Constants.borderSize * 2,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: Constants.borderSize,
        ),
      ),
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          Offset _localPosition = details.localPosition;
          if (_localPosition.dx >= 0 &&
              _localPosition.dx <= Constants.canvasSize &&
              _localPosition.dy >= 0 &&
              _localPosition.dy <= Constants.canvasSize) {
            setState(() {
              _points.add(_localPosition);
            });
          }
        },
        onPanEnd: (DragEndDetails details) {
          _points.add(null);
          _recognize();
        },
        child: CustomPaint(
          painter: DrawingPainter(_points),
        ),
      ),
    );
  }

  // Widget _mnistPreviewImage() {
  //   return Container(
  //     width: 100,
  //     height: 100,
  //     color: Colors.black,
  //     child: FutureBuilder(
  //       future: _previewImage(),
  //       builder: (BuildContext _, snapshot) {
  //         if (snapshot.hasData) {
  //           return Image.memory(
  //             snapshot.data,
  //             fit: BoxFit.fill,
  //           );
  //         } else {
  //           return Center(
  //             child: Text('Error'),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  void _initModel() async {
    var res = await _recognizer.loadModel();
    print(" model inited : $res");
  }

  // Future<Uint8List> _previewImage() async {
  //   return await _recognizer.previewImage(_points);
  // }

  _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    // setState(() {
    //   _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    // });
    return pred;
  }
}
