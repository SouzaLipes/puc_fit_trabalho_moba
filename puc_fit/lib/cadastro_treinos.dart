import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TreinoPage(),
    );
  }
}

class TreinoPage extends StatelessWidget {
  const TreinoPage({super.key});

  void _showExerciseModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const SizedBox(
            height: 400,
            child: ExerciseScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A53),
        title: const Text('LOGO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: () => _showExerciseModal(context),
              child: Card(
                color: const Color(0xFF4A90E2),
                child: const Center(
                  child: Text(
                    'Perna',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação do botão flutuante (Adicionar exercício)
        },
        backgroundColor: const Color(0xFF4A90E2),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Escolha a parte do Exercício:',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
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
                    'https://cdn-icons-png.flaticon.com/512/6619/6619275.png',
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
                    'https://cdn-icons-png.flaticon.com/512/1667/1667680.png',
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
                    'https://cdn-icons-png.flaticon.com/512/30/30773.png',
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
              color: Colors.black,
            ),
          ),
          Text(
            'x$repetitions',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
