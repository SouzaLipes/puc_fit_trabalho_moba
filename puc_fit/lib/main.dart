import 'package:flutter/material.dart';
import 'tela_calculo_imc.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculator(),
    );
  }
}
