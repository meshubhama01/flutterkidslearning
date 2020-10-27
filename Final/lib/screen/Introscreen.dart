import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:kid_learn/screen/homeScreen.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  static const String id = 'intro_screen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  AudioCache audioPlayer;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioCache();
    loadMusic();
  }

  loadMusic() async {
    await audioPlayer.load("button3.mp3");
  }

  Future loadDelay(context) async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD9D8CF),
      body: FutureBuilder(
        future: loadDelay(context),
        builder: (context, snap) {
          if (!snap.hasData) {
            return Container(
              alignment: Alignment.center,
              child: Image.asset('assets/slate.gif',
                  width: 450, height: 450, fit: BoxFit.contain),
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
