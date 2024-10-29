import 'package:flutter/material.dart';
import 'models/usuario.dart';
import 'tela_calculo_imc.dart';
import 'calendario_treinos.dart';
import 'perfil_usuario.dart'; // Import da tela de perfil

class TreinoPage extends StatelessWidget {
  final Usuario usuario;

  const TreinoPage({super.key, required this.usuario});

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

  void _showProfileModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 600,
            child: TelaPerfil(usuario: usuario),
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
        leading: PopupMenuButton<int>(
          icon: const Icon(Icons.menu),
          onSelected: (int result) {
            if (result == 1) {
              // Ação para IMC
            } else if (result == 2) {
              // Ação para Calendário de treinos
            } else if (result == 3) {
              // Ação para Perfil do usuário
            } else if (result == 4) {
              // Ação para Sair
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: const Icon(Icons.calculate_outlined),
                title: const Text('IMC'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IMCCalculator(),
                    ),
                  );
                },
              ),
            ),
            PopupMenuItem<int>(
              value: 2,
              child: ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Calendário de treinos'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarioTreinos(),
                    ),
                  );
                },
              ),
            ),
            PopupMenuItem<int>(
              value: 3,
              child: ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Perfil do usuário'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaPerfil(usuario: usuario),
                    ),
                  );
                },
              ),
            ),
            const PopupMenuItem<int>(
              value: 4,
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              _showProfileModal(context);
            },
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
              child: const Card(
                color: Color(0xFF4A90E2),
                child: Center(
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
            'Exercícios feitos:',
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
              exerciseName: 'Exercício 1: exemplo-exercício', repetitions: 3),
          const ExerciseItem(
              exerciseName: 'Exercício 2: exemplo-exercício', repetitions: 3),
          const ExerciseItem(
              exerciseName: 'Exercício 3: exemplo-exercício', repetitions: 3),
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
