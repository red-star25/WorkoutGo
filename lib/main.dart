import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workout/screens/workout_home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Workout_HomePage()
    );
  }
}