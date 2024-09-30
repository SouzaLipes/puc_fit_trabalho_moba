import 'package:flutter/material.dart';
import 'tela_calculo_imc.dart'; // Importa o arquivo do estado separado

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculator(), // Utiliza a classe IMCCalculator que agora está em outro arquivo
    );
  }
}
