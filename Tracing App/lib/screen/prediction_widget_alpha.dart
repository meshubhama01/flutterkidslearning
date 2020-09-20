import 'package:flutter/material.dart';
import 'package:kid_learn/Models/predictions.dart';

class PredictionWidget extends StatelessWidget {
  final List<Prediction> predictions;

  const PredictionWidget({Key key, this.predictions}) : super(key: key);

  Widget _numberWidget(String num, Prediction prediction) {
    return Column(
      children: <Widget>[
        Text(
          '$num',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: prediction == null
                ? Colors.black
                : Colors.yellow.withOpacity(
                    (prediction.confidence * 2).clamp(0, 1).toDouble(),
                  ),
          ),
        ),
        Text(
          '${prediction == null ? '' : prediction.confidence.toStringAsFixed(3)}',
          style: TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }

  List<dynamic> getPredictionStyles(List<Prediction> predictions) {
    List<dynamic> data = [
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null
    ];
    predictions?.forEach((prediction) {
      data[prediction.index] = prediction;
    });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    var styles = getPredictionStyles(this.predictions);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _numberWidget('A', styles[0]),
            _numberWidget('B', styles[1]),
            _numberWidget('C', styles[2]),
            _numberWidget('D', styles[3]),
            _numberWidget('E', styles[4]),
            _numberWidget('F', styles[5]),
            _numberWidget('G', styles[6]),
            _numberWidget('H', styles[7]),
            _numberWidget('I', styles[8])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _numberWidget('J', styles[9]),
            _numberWidget('K', styles[10]),
            _numberWidget('L', styles[11]),
            _numberWidget('M', styles[12]),
            _numberWidget('N', styles[13]),
            _numberWidget('0', styles[14]),
            _numberWidget('P', styles[15]),
            _numberWidget('Q', styles[16]),
            _numberWidget('R', styles[17])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _numberWidget('S', styles[18]),
            _numberWidget('T', styles[19]),
            _numberWidget('U', styles[20]),
            _numberWidget('V', styles[21]),
            _numberWidget('W', styles[22]),
            _numberWidget('X', styles[23]),
            _numberWidget('Y', styles[24]),
            _numberWidget('Z', styles[25])
          ],
        ),
      ],
    );
  }
}
