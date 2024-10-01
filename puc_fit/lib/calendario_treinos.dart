import 'package:flutter/material.dart';
import 'exercicios_feito_dia.dart';

class DaysScreen extends StatelessWidget {
  final List<String> days = ['Dia 1', 'Dia 2', 'Dia 3', 'Dia 4', 'Dia 5', 'Dia 6', 'Dia 7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios por Dia'),
      ),
      backgroundColor: Colors.grey[300], 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Exercícios Concluídos',
                style: TextStyle(
                  color: Colors.black, // Cor do texto em preto
                  fontSize: 20,
                  fontWeight: FontWeight.bold, // Texto em negrito
                ),
              ),
            ),
            SizedBox(height: 16.0), // Espaço entre o título e os cards
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Define 2 cards por linha
                  crossAxisSpacing: 10.0, // Espaçamento horizontal entre os cards
                  mainAxisSpacing: 10.0, // Espaçamento vertical entre os cards
                  childAspectRatio: 3 / 2, // Proporção dos cards (largura / altura)
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Color(0xFF4C5285), // Cor de fundo #4C5285
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciosFeitosDia(day: days[index]),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          days[index],
                          style: TextStyle(
                            color: Colors.white, // Texto branco para contraste
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
