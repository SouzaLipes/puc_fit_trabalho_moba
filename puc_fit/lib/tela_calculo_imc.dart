import 'package:flutter/material.dart';
import 'calendario_treinos.dart';
import 'perfil_usuario.dart';
import 'models/usuario.dart';
import 'cadastro_treinos.dart';
import 'package:flutter/services.dart';
import 'loginpage.dart';

class IMCCalculator extends StatefulWidget {
    final Usuario usuario;

  const IMCCalculator({super.key, required this.usuario});

  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();

  String _indiceIMC = '';
  String _nivelIMC = '';

  void _calcularIMC() {
    final double altura = double.tryParse(_alturaController.text) ?? 0;
    final double peso = double.tryParse(_pesoController.text) ?? 0;

    if (altura > 0 && peso > 0) {
      final double imc = peso / (altura * altura);

      String nivel;
      if (imc < 18.5) {
        nivel = "Abaixo do peso";
      } else if (imc >= 18.5 && imc < 24.9) {
        nivel = "Peso normal";
      } else if (imc >= 25 && imc < 29.9) {
        nivel = "Sobrepeso";
      } else {
        nivel = "Obesidade";
      }

      setState(() {
        _indiceIMC = imc.toStringAsFixed(2);
        _nivelIMC = nivel;
      });

      _showResultModal();
    } else {
      _showErrorModal();
    }
  }

  void _showResultModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Resultado',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Índice: $_indiceIMC',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Nível: $_nivelIMC',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showErrorModal() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Erro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Por favor, insira valores válidos para altura e peso.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Calculadora de IMC"),
        leading: PopupMenuButton<int>(
          icon: const Icon(Icons.menu),
          onSelected: (int result) {
            if (result == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TreinoPage(usuario: widget.usuario)),
              );
            } else if (result == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IMCCalculator(usuario: widget.usuario)),
              );
            } else if (result == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarioTreinos(usuario: widget.usuario)),
              );
            } else if (result == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaPerfil(usuario: widget.usuario)),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Calcular IMC',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Qual Sua Altura (centímetros)?',
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Qual Seu peso (quilos)?',
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _calcularIMC,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Calcular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
