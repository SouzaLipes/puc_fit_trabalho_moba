import 'package:flutter/material.dart';

class ExerciosFeitosDia extends StatelessWidget {
  final String day;
  final List<String> exercises = [
    'Agachamento',
    'Flexão de Braço',
    'Abdominal',
    'Corrida',
    'Polichinelo',
    'Prancha',
  ];

  ExerciosFeitosDia({required this.day});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ficha de Exercícios - $day'),
      ),
      backgroundColor: Colors.grey[300], // Fundo cinza para a tela de exercícios
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            color: Color(0xFF4C5285), // Cor de fundo do card #4C5285
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Lista de Exercícios Feitos',
                    style: TextStyle(
                      color: Colors.white, // Cor do texto em branco
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0), // Espaço entre o título e a lista
                  Expanded(
                    child: ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            exercises[index],
                            style: TextStyle(
                              color: Colors.white, // Cor do texto em branco
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
