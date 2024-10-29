import 'package:flutter/material.dart';
import 'perfil_usuario.dart';
import 'models/usuario.dart';
import 'cadastro_treinos.dart';
import 'tela_calculo_imc.dart';
import 'package:flutter/services.dart';
import 'loginpage.dart';

class CalendarioTreinos extends StatelessWidget {
  final List<String> days = [
    'Dia 01/01/2024',
    'Dia 02/01/2024',
    'Dia 03/01/2024',
    'Dia 04/01/2024',
    'Dia 05/01/2024',
    'Dia 06/01/2024',
    'Dia 07/01/2024',
  ];

  final Usuario usuario; // Adicione esta variável para passar o usuário

  CalendarioTreinos({super.key, required this.usuario}); // Adicione o parâmetro no construtor

  void _showExercisesDialog(BuildContext context, String day) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(day),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Exercício 1: exemplo-exercicio'),
                trailing: Text('x3'),
              ),
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Exercício 2: exemplo-exercicio'),
                trailing: Text('x3'),
              ),
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Exercício 3: exemplo-exercicio'),
                trailing: Text('x3'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Center(child: Text("Calendário de Treinos")),
        leading: PopupMenuButton<int>(
          icon: const Icon(Icons.menu),
          onSelected: (int result) {
            if (result == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TreinoPage(usuario: usuario)),
              );
            } else if (result == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IMCCalculator(usuario: usuario)),
              );
            } else if (result == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarioTreinos(usuario: usuario)),
              );
            } else if (result == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPerfil(usuario: usuario)),
              );
            } else if (result == 5) {
                  Navigator.pop(context); // Fecha o PopupMenu
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(), // Navega para a tela de login
                    ),
                  );
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Cadastro de Treinos'),
              ),
            ),
            const PopupMenuItem<int>(
              value: 2,
              child: ListTile(
                leading: Icon(Icons.calculate_outlined),
                title: Text('IMC'),
              ),
            ),
            const PopupMenuItem<int>(
              value: 3,
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Calendário de treinos'),
              ),
            ),
            const PopupMenuItem<int>(
              value: 4,
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Perfil do usuário'),
              ),
            ),
            const PopupMenuItem<int>(
              value: 5,
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Text(
                'Exercícios Concluídos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xFF4C5285),
                    child: InkWell(
                      onTap: () {
                        _showExercisesDialog(context, days[index]);
                      },
                      child: Center(
                        child: Text(
                          days[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
