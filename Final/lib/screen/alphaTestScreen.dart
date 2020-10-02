// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'prediction_widget_alpha.dart';
import 'package:kid_learn/Models/predictions.dart';
import 'package:kid_learn/drawing_painter.dart';
import 'dart:math';
import 'package:kid_learn/recognizer_alpha.dart';
import 'package:kid_learn/constants.dart';

import '../alert.dart';

class AlphaTestScreen extends StatefulWidget {
  static const String id = 'alphatest_screen';
  @override
  _AlphaTestScreenState createState() => _AlphaTestScreenState();
}

class _AlphaTestScreenState extends State<AlphaTestScreen> {
  final _points = List<Offset>();
  final _recognizer = Recognizer();
  List<Prediction> _prediction;
  bool initialize = false;
  Random _rand = Random();
  int _randAlpha = 0;
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

  @override
  void initState() {
    super.initState();
    _initModel();
    setState(() {
      _randAlpha = _rand.nextInt(26);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text('Alphabets Test'),
      ),
      body: Column(
        children: <Widget>[
          // Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: <Widget>[
          //             Text(
          //               'test kr rha hoon',
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             Text(
          //               'image on right',
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     _mnistPreviewImage(),
          //   ],
          // ),
          SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              ' Write :-       " ${alphabetsLUT[_randAlpha]} "',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          _drawCanvasWidget(),
          SizedBox(
            height: 25,
          ),
          // PredictionWidget(
          //   predictions: _prediction,
          // ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.replay),
                  onPressed: () {
                    _points.clear();
                    _randAlpha = _rand.nextInt(25);
                    _prediction.clear();

                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    try {
                      _points.clear();
                      _prediction.clear();
                    } catch (e) {
                      print("error : $e");
                    }
                    setState(() {});
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () async {
                    var predList = await _recognize();
                    if (predList[0]['label'] == alphabetsLUT[_randAlpha] &&
                        predList[0]['confidence'] > 0.50) {
                      var p = await testPopup(context, "Well Done !", 'next');
                      if (p == true) {
                        setState(() {
                          _points.clear();
                          _prediction.clear();
                        });
                      } else if (p == false) {
                        _points.clear();
                        _prediction.clear();
                        setState(() {
                          _randAlpha = _rand.nextInt(25);
                        });
                      }
                    } else {
                      var p = await testPopup(context, "Try Again!", 'redo');
                      if (p == true) {
                        setState(() {
                          _points.clear();
                          _prediction.clear();
                        });
                      }
                    }
                  },
                ),
              ],
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
    print(" Model inited: $res");
  }

  // Future<Uint8List> _previewImage() async {
  //   return await _recognizer.previewImage(_points);
  // }

  _recognize() async {
    List<dynamic> pred = await _recognizer.recognize(_points);
    _prediction = pred.map((json) => Prediction.fromJson(json)).toList();
    print(" My prediction : $pred");
    return pred;
  }
}
