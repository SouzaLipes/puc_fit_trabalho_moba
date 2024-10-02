import 'package:flutter/material.dart';
import 'tela_calculo_imc.dart'; 
import 'exercise_screen.dart';
import 'days_screen.dart';
import 'package:puclifters/loginpage.dart';
import 'chave_de_acesso.dart';
import 'perfil_usuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculator(),
      initialRoute: '/',
      routes: {
        '/': (context) => ExerciseScreen(),
        '/days': (context) => DaysScreen(),
        '/imc': (context) => IMCCalculator(),
        '/login': (context) => LoginPage(),
        '/chave': (context) => RegisterPage(),
        '/perfil': (context) => UserProfile(),
      },
    );
  }
}
