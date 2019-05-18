import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lm_flutter/fragments/home_fragment.dart';
import 'package:lm_flutter/pages/spash_page.dart';
import 'package:lm_flutter/ui/lm_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Fixing App Orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter LM Demo',
      theme: new ThemeData(
          primarySwatch: LmColors.BASE,
          hintColor: Colors.white,
          inputDecorationTheme: new InputDecorationTheme(
              labelStyle: new TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0)))),
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomeFragment()
      },
    );
  }
}
