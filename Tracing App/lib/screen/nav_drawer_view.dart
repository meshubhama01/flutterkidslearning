import 'package:flutter/material.dart';

import '../constants.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 30.0),
                child: Text("Home", style: navDrawerTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 30.0),
                child: Text("App Settings", style: navDrawerTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 30.0),
                child: Text("Profile", style: navDrawerTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 30.0),
                child: Text("About Author", style: navDrawerTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
