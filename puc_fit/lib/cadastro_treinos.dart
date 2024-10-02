import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A90E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Escolha a parte do Exercício:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/6619/6619275.png', // Imagem do bíceps
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/1667/1667680.png', // Imagem de uma coxa/perna
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/30/30773.png', // Imagem de uma panturrilha/pé
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ExerciseItem(
                exerciseName: 'Exercicio 1: exemplo-exercicio', repetitions: 3),
            const ExerciseItem(
                exerciseName: 'Exercicio 2: exemplo-exercicio', repetitions: 3),
            const ExerciseItem(
                exerciseName: 'Exercicio 3: exemplo-exercicio', repetitions: 3),
            const Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              color: const Color(0xFFD9D9D9),
              child: const Center(
                child: Text(
                  'Campo para adicionar novo exercício',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseItem extends StatelessWidget {
  final String exerciseName;
  final int repetitions;

  const ExerciseItem(
      {super.key, required this.exerciseName, required this.repetitions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            exerciseName,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            'x$repetitions',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
