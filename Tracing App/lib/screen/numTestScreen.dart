import 'package:flutter/material.dart';
import 'package:kid_learn/main.dart';
import 'package:kid_learn/constants.dart';
import 'package:kid_learn/drawing_painter.dart';
import 'package:kid_learn/test_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:kid_learn/alert.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.red,
                alignment: Alignment.center,
                child: Text('Header'),
              ),
            ),
            Container(
              decoration: new BoxDecoration(
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
                        points.add(
                            renderBox.globalToLocal(details.globalPosition));
                      });
                    },
                    onPanStart: (details) {
                      setState(() {
                        RenderBox renderBox = context.findRenderObject();
                        points.add(
                            renderBox.globalToLocal(details.globalPosition));
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
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('Footer'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List predictions = await brain.processCanvasPoints(points);
          print(predictions);
          _cleanDrawing();
          testPopup(context);
        },
        tooltip: 'clean',
        child: Icon(Icons.delete),
      ),
    );
  }
}
