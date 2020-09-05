import 'package:flutter/material.dart';

const double kCanvasSize = 400.0;
const double kStrokeWidth = 12.0;
const Color kBlackBrushColor = Colors.black;
const bool kIsAntiAlias = true;
const int kModelInputSize = 28;
const double kCanvasInnerOffset = 80.0;
const Color kBrushBlack = Colors.black;
const Color kBrushWhite = Colors.white;

final Paint kDrawingPaint = Paint()
  ..strokeCap = StrokeCap.square
  ..isAntiAlias = kIsAntiAlias
  ..color = kBrushBlack
  ..strokeWidth = kStrokeWidth;

final Paint kWhitePaint = Paint()
  ..strokeCap = StrokeCap.square
  ..isAntiAlias = kIsAntiAlias
  ..color = kBrushWhite
  ..strokeWidth = kStrokeWidth;

final kBackgroundPaint = Paint()..color = kBrushBlack;
