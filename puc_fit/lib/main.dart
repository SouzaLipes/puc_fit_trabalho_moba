import 'package:flutter/material.dart';
import 'calendario_treinos.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalendarioTreinos(),
    );
  }
}
