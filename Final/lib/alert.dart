import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

testPopup(BuildContext dialogContext, String info1, String info2) {
  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    overlayColor: Colors.black87,
    isCloseButton: false,
    isOverlayTapDismiss: true,
    titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    descStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    animationDuration: Duration(milliseconds: 400),
  );
  List<DialogButton> _one = [
    DialogButton(
      child: Text(
        "Retry",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onPressed: () {
        Navigator.pop(dialogContext, true);
      },
      color: Colors.black54,
    ),
    DialogButton(
      child: Text(
        "Next",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onPressed: () {
        Navigator.pop(dialogContext, false);
      },
      color: Colors.black54,
    )
  ];

  List<DialogButton> _two = [
    DialogButton(
      child: Text(
        "Retry",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onPressed: () {
        Navigator.pop(dialogContext, true);
      },
      color: Colors.black54,
    ),
  ];

  return Alert(
          context: dialogContext,
          style: alertStyle,
          title: "Results",
          desc: "$info1",
          buttons: info2 == "next" ? _one : _two)
      .show();
}
