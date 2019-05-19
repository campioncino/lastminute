import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lm_flutter/ui/lm_colors.dart';

class EmptyPage extends StatefulWidget {
  @override
  EmptyPageState createState() => EmptyPageState();
}

class EmptyPageState extends State<EmptyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/images/flamoji41.gif"),
                fit: BoxFit.fitWidth,
              ),
              Text(
                "SECTION NOT AVAILABLE",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: LmColors.BASE_ACCENT),
              ),
            ],
          ),
        ));
  }
}
