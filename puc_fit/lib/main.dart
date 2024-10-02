import 'package:flutter/material.dart';
import 'exercise_screen.dart';
import 'days_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ExerciseScreen(),
      },
    );
  }
}
