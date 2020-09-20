import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kid_learn/screen/nav_drawer_view.dart';
// import 'package:kid_learn/main.dart';
// import 'package:kid_learn/screen/alphaPractiseScreen.dart';
import 'package:kid_learn/screen/testorpractise.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  static bool alpha;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      endDrawer: DrawerWidget(),
      backgroundColor: Colors.amberAccent,
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  "LET'S LEARN",
                  style: GoogleFonts.permanentMarker(
                    textStyle: TextStyle(
                        fontSize: 42,
                        color: Colors.blue[700],
                        letterSpacing: .5),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      color: Colors.red,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            //border: Border.all(),
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Image.asset("assets/abc.png"),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Image.asset("assets/forward.png"),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                      onPressed: () {
                        HomeScreen.alpha = true;
                        setState(() {
                          Navigator.pushNamed(context, TestorPractise.id);
                        });
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      color: Colors.green,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            //border: Border.all(),
                            borderRadius: BorderRadius.circular(22.0)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Image.asset("assets/123.png"),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.20,
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Image.asset("assets/forward.png"),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                      onPressed: () {
                        HomeScreen.alpha = false;
                        setState(() {
                          Navigator.pushNamed(context, TestorPractise.id);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
