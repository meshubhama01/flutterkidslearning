import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:kid_learn/main.dart';
import 'package:kid_learn/constants.dart';
import 'package:kid_learn/drawing_painter.dart';
import 'package:kid_learn/test_brain.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

int numberToTest;

Random rand = Random();

class NumTestScreen extends StatefulWidget {
  static const String id = 'numtest_screen';
  @override
  _NumTestScreenState createState() => _NumTestScreenState();
}

class _NumTestScreenState extends State<NumTestScreen> {
  List<Offset> points = List();
  AppBrain brain = AppBrain();

  void _cleanDrawing() {
    setState(() {
      points = List();
    });
  }

  @override
  void initState() {
    super.initState();
    brain.loadModel();
    numberToTest = rand.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The Header part !
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Color(0XFFff5722),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Draw: ",
                      style: TextStyle(color: Colors.white, fontSize: 45.0),
                    ),
                    Text(
                      " $numberToTest ",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45.0),
                    ),
                  ],
                ),
              ),
            ),

            // The Body part !

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    border: new Border.all(
                      width: 3.0,
                      color: Colors.blue,
                    ),
                  ),
                  child: Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            RenderBox renderBox = context.findRenderObject();
                            points.add(renderBox
                                .globalToLocal(details.globalPosition));
                          });
                        },
                        onPanStart: (details) {
                          setState(() {
                            RenderBox renderBox = context.findRenderObject();
                            points.add(renderBox
                                .globalToLocal(details.globalPosition));
                          });
                        },
                        onPanEnd: (details) async {
                          points.add(null);

                          setState(() {});
                        },
                        child: ClipRect(
                          child: CustomPaint(
                            size: Size(kCanvasSize, kCanvasSize),
                            painter: DrawingPainter(
                              offsetPoints: points,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // The Footerr part !
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Color(0XFFffd571),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Color(0XFF065446),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 26.0,
                      ),
                      // Text(
                      //   "Clean",
                      //   style: TextStyle(color: Colors.white, fontSize: 22.0),
                      // ),
                      onPressed: () {
                        _cleanDrawing();
                      },
                    ),

                    RaisedButton(
                      color: Color(0XFF065446),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                      onPressed: () async {
                        List predictions =
                            await brain.processCanvasPoints(points);
                        //  print(predictions);

                        int _detectedNumber = predictions[0]['index'];
                        double _confidence = predictions[0]['confidence'];
                        String resultText = "";
                        String buttonText = "Retry";
                        bool _isShow = false;
                        print("detected number is: $_detectedNumber");
                        print("confidence is: $_confidence");
                        if (_detectedNumber == numberToTest) {
                          if (_confidence > 0.80) {
                            print(" excellent case");
                            buttonText = "Another";
                            _isShow = true;
                            resultText = "Excellent!";
                          } else if (_confidence > 0.50 &&
                              _confidence <= 0.80) {
                            resultText = "Good Job!";
                            buttonText = "Another";
                            _isShow = true;
                            print(" good case");
                          } else {
                            print(" bad case");

                            resultText = "Try Again!";
                          }
                        } else {
                          resultText = "No, Try Again!";
                        }
                        _cleanDrawing();
                        // Showing of the alert part

                        buildAlert(context, resultText, _isShow, buttonText)
                            .show();
                      },
                    ),

                    // Text('Footer'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     List predictions = await brain.processCanvasPoints(points);
      //     //  print(predictions);

      //     int _detectedNumber = predictions[0]['index'];
      //     double _confidence = predictions[0]['confidence'];
      //     String resultText = "";
      //     String buttonText = "Retry";
      //     bool _isShow = false;
      //     print("detected number is: $_detectedNumber");
      //     print("confidence is: $_confidence");
      //     if (_detectedNumber == numberToTest) {
      //       if (_confidence > 0.80) {
      //         print(" excellent case");
      //         buttonText = "Another";
      //         _isShow = true;
      //         resultText = "Excellent!";
      //       } else if (_confidence > 0.50 && _confidence <= 0.80) {
      //         resultText = "Good Job!";
      //         buttonText = "Another";
      //         _isShow = true;
      //         print(" good case");
      //       } else {
      //         print(" bad case");

      //         resultText = "Try Again!";
      //       }
      //     } else {
      //       resultText = "No, Try Again!";
      //     }
      //     _cleanDrawing();
      //     // Showing of the alert part

      //     buildAlert(context, resultText, _isShow, buttonText).show();
      //   },
      //   tooltip: 'clean',
      //   child: Icon(Icons.delete),
      // ),
    );
  }

  // Building alert. a.k.a the alert UI definition
  Alert buildAlert(BuildContext context, String resultText, bool _isShow,
      String buttonText) {
    return Alert(
        context: context,
        style: AlertStyle(
          animationType: AnimationType.grow,
          overlayColor: Colors.black87,
          isCloseButton: false,
          isOverlayTapDismiss: true,
          titleStyle: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black54),
          descStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          animationDuration: Duration(milliseconds: 400),
        ),
        title: "Results",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: Text(
            //     " Number Given: $numberToTest",
            //     style: TextStyle(fontSize: 12),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "$resultText",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _isShow
                    ? FlatButton(
                        child: Text(
                          "Retry",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.black54,
                      )
                    : Container(),
                SizedBox(
                  width: 12.0,
                ),
                FlatButton(
                  child: Text(
                    "$buttonText",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      int _numberToTest = rand.nextInt(10);
                      if (numberToTest == _numberToTest) {
                        numberToTest = rand.nextInt(10);
                      } else {
                        numberToTest = _numberToTest;
                      }
                    });
                    Navigator.pop(context);
                  },
                  color: Colors.black54,
                )
              ],
            )
          ],
        ),
        buttons: []);
  }
}
