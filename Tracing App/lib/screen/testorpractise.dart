import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kid_learn/main.dart';
import 'package:kid_learn/screen/alphaPractiseScreen.dart';
import 'package:kid_learn/screen/alphaTestScreen.dart';
import 'package:kid_learn/screen/homeScreen.dart';
import 'package:kid_learn/screen/numPractiseScreen.dart';
import 'package:kid_learn/screen/numTestScreen.dart';

class TestorPractise extends StatefulWidget {
  static const String id = 'testorpractise_screen';
  @override
  _TestorPractiseState createState() => _TestorPractiseState();
}

class _TestorPractiseState extends State<TestorPractise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(22.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Image.asset("assets/bunny_head.jpeg"),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          alignment: Alignment.center,
                          child: Text(
                            "Practice",
                            style: GoogleFonts.permanentMarker(
                              textStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    if (HomeScreen.alpha == true) {
                      setState(() {
                        Navigator.pushNamed(context, AlphaPractiseScreen.id);
                      });
                    }
                    if (HomeScreen.alpha == false) {
                      setState(() {
                        Navigator.pushNamed(context, NumPractiseScreen.id);
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(22.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: Image.asset("assets/lion_head.jpeg"),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          alignment: Alignment.center,
                          child: Text(
                            " Test ",
                            style: GoogleFonts.permanentMarker(
                              textStyle: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    if (HomeScreen.alpha == true) {
                      setState(() {
                        Navigator.pushNamed(context, AlphaTestScreen.id);
                      });
                    }
                    if (HomeScreen.alpha == false) {
                      setState(() {
                        Navigator.pushNamed(context, NumTestScreen.id);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
