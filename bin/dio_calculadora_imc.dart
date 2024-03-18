import 'dart:js_util';

import 'package:dio_calculadora_imc/class/pessoa.dart';
import 'package:dio_calculadora_imc/dio_calculadora_imc.dart';

void main(List<String> arguments) {
  List<Pessoa>? listapessoa = [];
  String continuar;
  do {
    print("Bem vindo ao sistema Calculadora de Imc");

    var nome = lerEntradaString('Informe o seu nome: ');
    var peso = leitorEntradaDouble('Informe o seu peso: ');
    var altura = leitorEntradaDouble('Informe a sua altura: ');

    // Criando uma instância de Pessoa com os dados fornecidos
    Pessoa pessoa = Pessoa(nome, altura, peso);

    // Calculando o IMC e a classificação
    var imc = calculateImc(pessoa);
    var classe = classificacaoImc(imc);

    // Atribuindo o IMC e a classificação à instância de Pessoa
    pessoa.imc = imc;
    pessoa.classe = classe;

    // Exibindo o IMC e a classificação
    print(pessoa.ExibirImcCalasse());
    listapessoa.add(pessoa);
    continuar = lerEntradaString("Deseja continuar? y/n");
  } while (continuar == 'y');
  print("\n\nLista de pessoas: ");
  listapessoa.forEach((element) {
    print('${element.toString()}\n');
  });
}
