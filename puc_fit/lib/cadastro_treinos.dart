class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A90E2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Escolha a parte do Exercício:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
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
                SizedBox(width: 16),
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
                SizedBox(width: 16),
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
            SizedBox(height: 16),
            ExerciseItem(
                exerciseName: 'Exercicio 1: exemplo-exercicio', repetitions: 3),
            ExerciseItem(
                exerciseName: 'Exercicio 2: exemplo-exercicio', repetitions: 3),
            ExerciseItem(
                exerciseName: 'Exercicio 3: exemplo-exercicio', repetitions: 3),
            Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              color: Color(0xFFD9D9D9),
              child: Center(
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

  const ExerciseItem({required this.exerciseName, required this.repetitions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            exerciseName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            'x$repetitions',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
