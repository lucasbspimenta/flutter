import 'dart:convert';
import 'package:checklist/dao/agendamentotipo_dao.dart';

import 'agendamentotipo_model.dart';

class AgendamentoModel {
  final int id;
  final DateTime data;
  final String unidade;
  final int unidadeId;
  final bool concluido;
  final DateTime? dataConclusao;
  final Future<AgendamentoTipoModel> tipo;

  AgendamentoModel({
    required this.data,
    required this.unidade,
    required this.unidadeId,
    this.concluido = false,
    this.dataConclusao,
    required this.tipo,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': data.millisecondsSinceEpoch,
      'unidade': unidade,
      'unidadeId': unidadeId,
      'concluido': concluido,
      'dataConclusao': dataConclusao?.millisecondsSinceEpoch,
      'tipo': tipo.toMap(),
      'id': id,
    };
  }

  factory AgendamentoModel.fromMap(Map<String, dynamic> map) {
    return AgendamentoModel(
      data: DateTime.fromMillisecondsSinceEpoch(map['data']),
      unidade: map['unidade'],
      unidadeId: map['unidadeId'],
      concluido: map['concluido'],
      dataConclusao: (map['dataConclusao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dataConclusao'])
          : null),
      tipo: AgendamentoTipoDao()
          .find(map['tipo']), //AgendamentoTipoModel.fromMap(map['tipo']),
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AgendamentoModel.fromJson(String source) =>
      AgendamentoModel.fromMap(json.decode(source));
}
