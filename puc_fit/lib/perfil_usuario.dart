import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});
  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil do Usuário"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Imagem centralizada
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/3x4.png'),
                ),
                const SizedBox(height: 20),
                // Nome do usuário
                const Text(
                  'Nome do Usuário',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Detalhes do perfil envolto por um Card
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileDetailRow(
                          icon: Icons.person_outline,
                          label: 'Código Pessoa',
                          value: '9985635',
                        ),
                        ProfileDetailRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'Idade',
                          value: '30 anos',
                        ),
                        ProfileDetailRow(
                          icon: Icons.male_outlined,
                          label: 'Gênero',
                          value: 'Masculino',
                        ),
                        ProfileDetailRow(
                          icon: Icons.fitness_center_outlined,
                          label: 'Peso',
                          value: '80 quilos',
                        ),
                        ProfileDetailRow(
                          icon: Icons.height_outlined,
                          label: 'Altura',
                          value: '180 cm',
                        ),
                        ProfileDetailRow(
                          icon: Icons.calculate_outlined,
                          label: 'IMC',
                          value: '26,4',
                        ),
                        ProfileDetailRow(
                          icon: Icons.flag_outlined,
                          label: 'Objetivos',
                          value:
                              'Perder Gordura, Condicionamento Físico, Qualidade de Vida',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const ProfileDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Para alinhar texto que pode ter várias linhas
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Ajustando para texto multilinhas
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
              softWrap:
                  true, // Permite que o texto seja quebrado em múltiplas linhas
            ),
          ),
        ],
      ),
    );
  }
}