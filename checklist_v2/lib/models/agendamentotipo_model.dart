import 'dart:convert';

class AgendamentoTipoModel {
  final int id;
  final String nome;
  final String cor;

  AgendamentoTipoModel({
    required this.id,
    required this.nome,
    required this.cor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'cor': cor,
    };
  }

  factory AgendamentoTipoModel.fromMap(Map<String, dynamic> map) {
    return AgendamentoTipoModel(
      id: map['id'],
      nome: map['nome'],
      cor: map['cor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AgendamentoTipoModel.fromJson(String source) =>
      AgendamentoTipoModel.fromMap(json.decode(source));
}
