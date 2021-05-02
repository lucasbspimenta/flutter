import 'dart:convert';

import 'package:checklist/models/checklist_model.dart';
import 'package:checklist/models/item_model.dart';

enum RespostaValor {
  na,
  conforme,
  inconforme,
}

extension RespostaValorStringExt on String {
  RespostaValor get respostaParse => {
        "na": RespostaValor.na,
        "conforme": RespostaValor.conforme,
        "inconforme": RespostaValor.inconforme,
      }[this]!;
}

extension RespostaValorExt on RespostaValor {
  String get parse => {
        RespostaValor.na: "na",
        RespostaValor.conforme: "conforme",
        RespostaValor.inconforme: "inconforme",
      }[this]!;
}

class ItemRepostaModel {
  final int id;
  final ItemModel item;
  final RespostaValor resposta;
  final String? foto;
  final ChecklistModel checklist;

  ItemRepostaModel({
    required this.id,
    required this.item,
    required this.resposta,
    this.foto,
    required this.checklist,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item.toMap(),
      'resposta': resposta.parse,
      'foto': foto,
      'checklist': checklist.toMap(),
    };
  }

  factory ItemRepostaModel.fromMap(Map<String, dynamic> map) {
    return ItemRepostaModel(
      id: map['id'],
      item: ItemModel.fromMap(map['item']),
      resposta: map['resposta'].toString().respostaParse,
      foto: map['foto'],
      checklist: ChecklistModel.fromMap(map['checklist']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemRepostaModel.fromJson(String source) =>
      ItemRepostaModel.fromMap(json.decode(source));
}
