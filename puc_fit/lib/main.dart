import 'package:flutter/material.dart';
import 'tela_calculo_imc.dart';
import 'cadastro_treinos.dart';
import 'package:puclifters/loginpage.dart';
import 'chave_de_acesso.dart';
import 'perfil_usuario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/exercice': (context) => const ExerciseScreen(),
        '/': (context) => IMCCalculator(),
        '/login': (context) => const LoginPage(),
        '/chave': (context) => const RegisterPage(),
        '/perfil': (context) => const TelaPerfil(),
      },
    );
  }
}
