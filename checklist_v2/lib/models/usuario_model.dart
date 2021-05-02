import 'dart:convert';

class UsuarioModel {
  final String matricula;
  final String nome;
  final String? foto;

  UsuarioModel({
    required this.nome,
    required this.matricula,
    this.foto,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'matricula': matricula,
      'foto': foto,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      nome: map['nome'],
      matricula: map['matricula'],
      foto: map['foto'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source));
}
