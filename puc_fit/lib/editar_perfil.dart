import 'package:flutter/material.dart';

import 'models/usuario.dart';

class EditarPerfil extends StatefulWidget {
  final Usuario usuario;

  const EditarPerfil({super.key, required this.usuario});

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  final _formKey = GlobalKey<FormState>();
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
        title: const Text('Editar Perfil'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              initialValue: usuario.codigoPessoa,
              decoration: const InputDecoration(
                labelText: 'Código Pessoa',
              ),
              onSaved: (value) {
                usuario.codigoPessoa = value!;
              },
            ),
            TextFormField(
              initialValue: usuario.idade,
              decoration: const InputDecoration(
                labelText: 'Idade',
              ),
              onSaved: (value) {
                usuario.idade = value!;
              },
            ),
            TextFormField(
              initialValue: usuario.genero,
              decoration: const InputDecoration(
                labelText: 'Gênero',
              ),
              onSaved: (value) {
                usuario.genero = value!;
              },
            ),
            TextFormField(
              initialValue: usuario.peso,
              decoration: const InputDecoration(
                labelText: 'Peso',
              ),
              onSaved: (value) {
                usuario.peso = value!;
              },
            ),
            TextFormField(
              initialValue: usuario.altura,
              decoration: const InputDecoration(
                labelText: 'Altura',
              ),
              onSaved: (value) {
                usuario.altura = value!;
              },
            ),
            TextFormField(
              initialValue: usuario.imc,
              decoration: const InputDecoration(
                labelText: 'IMC',
              ),
              onSaved: (value) {
                usuario.imc = value!;
              },
            ),
            TextFormField(
              initialValue: usuario.objetivos,
              decoration: const InputDecoration(
                labelText: 'Objetivos',
              ),
              onSaved: (value) {
                usuario.objetivos = value!;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pop(context, usuario);
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
