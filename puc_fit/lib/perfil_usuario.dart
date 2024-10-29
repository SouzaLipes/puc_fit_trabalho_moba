import 'package:flutter/material.dart';
import 'editar_perfil.dart';
import 'models/usuario.dart';

class TelaPerfil extends StatefulWidget {
  final Usuario usuario;

  const TelaPerfil({super.key, required this.usuario});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  late Usuario usuario;

  @override
  void initState() {
    super.initState();
    usuario = widget.usuario;
  }

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
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/3x4.png'),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nome do Usuário',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileDetailRow(
                          icon: Icons.person_outline,
                          label: 'Código Pessoa',
                          value: usuario.codigoPessoa,
                        ),
                        ProfileDetailRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'Idade',
                          value: usuario.idade,
                        ),
                        ProfileDetailRow(
                          icon: Icons.male_outlined,
                          label: 'Gênero',
                          value: usuario.genero,
                        ),
                        ProfileDetailRow(
                          icon: Icons.fitness_center_outlined,
                          label: 'Peso',
                          value: usuario.peso,
                        ),
                        ProfileDetailRow(
                          icon: Icons.height_outlined,
                          label: 'Altura',
                          value: usuario.altura,
                        ),
                        ProfileDetailRow(
                          icon: Icons.calculate_outlined,
                          label: 'IMC',
                          value: usuario.imc,
                        ),
                        ProfileDetailRow(
                          icon: Icons.flag_outlined,
                          label: 'Objetivos',
                          value: usuario.objetivos,
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final novoUsuario = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarPerfil(usuario: usuario),
                      ),
                    );
                    if (novoUsuario != null) {
                      setState(() {
                        usuario = novoUsuario;
                      });
                    }
                  },
                  child: const Text('Editar Perfil'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
