import 'dart:convert';
import 'package:floor/floor.dart';

class ItemModel {
  @primaryKey
  final int id;
  final String nome;
  final String descricao;
  final bool foto;
  final ItemModel? itemPai;

  ItemModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.foto,
    this.itemPai,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'foto': foto,
      'itemPai': itemPai?.toMap(),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      foto: map['foto'],
      itemPai: ItemModel.fromMap(map['itemPai']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));
}
