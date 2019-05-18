import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:lm_flutter/ui/lm_colors.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Material(
      child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image(
                  image: new AssetImage("assets/images/flamoji16.gif"),
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  "WELCOME",
                  textScaleFactor: 2.0,
                  style: TextStyle(
                    inherit: true,
                    color: LmColors.BASE_ACCENT,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
