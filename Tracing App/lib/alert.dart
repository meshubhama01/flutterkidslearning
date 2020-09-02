import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';

testPopup(BuildContext dialogContext) {
  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    overlayColor: Colors.black87,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    descStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    animationDuration: Duration(milliseconds: 400),
  );

  Alert(
      context: dialogContext,
      style: alertStyle,
      title: "Report",
      desc: "yha pr accuracy btana h",
      buttons: [
        DialogButton(
          child: Text(
            "Retry",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {},
          color: Colors.black54,
        ),
        DialogButton(
          child: Text(
            "Next",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {},
          color: Colors.black54,
        )
      ]).show();
}
