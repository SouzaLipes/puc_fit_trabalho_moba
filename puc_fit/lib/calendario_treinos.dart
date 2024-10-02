import 'package:flutter/material.dart';
import 'exercicios_feito_dia.dart';

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

  CalendarioTreinos({super.key});

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
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Center(child: Text("LOGO")),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
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
