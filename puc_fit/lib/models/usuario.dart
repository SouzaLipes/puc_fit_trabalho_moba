class Usuario {
  String codigoPessoa;
  String idade;
  String genero;
  String peso;
  String altura;
  String imc;
  String objetivos;

  Usuario({
    required this.codigoPessoa,
    required this.idade,
    required this.genero,
    required this.peso,
    required this.altura,
    required this.imc,
    required this.objetivos,
  });

  Usuario.empty()
      : codigoPessoa = '',
        idade = '',
        genero = '',
        peso = '',
        altura = '',
        imc = '',
        objetivos = '';
}
