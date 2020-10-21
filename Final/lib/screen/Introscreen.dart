import 'package:flutter/material.dart';
import 'package:kid_learn/screen/homeScreen.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatelessWidget {
  static const String id = 'intro_screen';
  Future loadDelay(context) async {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadDelay(context),
        builder: (context, snap) {
          if (!snap.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "SLATE",
                    style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset('assets/rocket.json',
                      width: 300, height: 300, fit: BoxFit.contain),
                ),
              ],
            );
          } else {
            return Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "SLATE",
                    style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Lottie.asset('assets/rocket.json',
                      width: 150, height: 150, fit: BoxFit.contain),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
