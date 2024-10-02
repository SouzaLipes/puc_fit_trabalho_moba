import 'package:flutter/material.dart';

class IMCCalculator extends StatefulWidget {
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
          content: Container(
            height: 200,
            width: 300,
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
                SizedBox(height: 30),
                Text(
                  'Índice: $_indiceIMC',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Nível: $_nivelIMC',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Salvar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
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
          content: Container(
            height: 100,
            width: 300,
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
                SizedBox(height: 10),
                const Text(
                  'Por favor, insira valores válidos para altura e peso.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
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
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Center(child: Text("LOGO")),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calcular IMC',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Qual Sua Altura?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Qual Seu peso?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
