import 'package:flutter/material.dart';
import 'recognizer_screen.dart';

void main() => runApp(HandwrittenNumberRecognizerApp());

class HandwrittenNumberRecognizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digit Predictor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecognizerScreen(
        title: 'Digit Predictor',
      ),
    );
  }
}
