import 'package:flutter/material.dart';
import 'models/usuario.dart';
import 'tela_calculo_imc.dart';
import 'cadastro_treinos.dart';
import 'package:puclifters/loginpage.dart';
import 'chave_de_acesso.dart';
import 'perfil_usuario.dart';
import 'calendario_treinos.dart';

void main() {
  Usuario usuario = Usuario(
    codigoPessoa: 'Atualize seus dados',
    idade: 'Atualize seus dados',
    genero: 'Atualize seus dados',
    peso: 'Atualize seus dados',
    altura: 'Atualize seus dados',
    imc: 'Atualize seus dados',
    objetivos: 'Atualize seus dados',
  );
  runApp(MyApp(usuario: usuario));
}

class MyApp extends StatelessWidget {
  final Usuario usuario;

  MyApp({super.key, Usuario? usuario}) : usuario = usuario ?? Usuario.empty();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/exercice': (context) => TreinoPage(usuario: usuario),
        '/': (context) =>  IMCCalculator(usuario: usuario),
        '/login': (context) => const LoginPage(),
        '/chave': (context) => const RegisterPage(),
        '/perfil': (context) => TelaPerfil(usuario: usuario),
        '/calendarioTreinos': (context) => CalendarioTreinos(usuario: usuario),
      },
    );
  }
}
