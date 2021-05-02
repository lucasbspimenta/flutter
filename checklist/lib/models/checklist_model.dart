import 'dart:convert';
import 'package:floor/floor.dart';
import 'package:checklist/models/agendamento_model.dart';

class ChecklistModel {
  @primaryKey
  final int id;
  final DateTime inicio;
  final DateTime? conclusao;
  final AgendamentoModel agendamento;

  ChecklistModel({
    required this.id,
    required this.inicio,
    this.conclusao,
    required this.agendamento,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'inicio': inicio.millisecondsSinceEpoch,
      'conclusao': conclusao?.millisecondsSinceEpoch,
      'agendamento': agendamento.toMap(),
    };
  }

  factory ChecklistModel.fromMap(Map<String, dynamic> map) {
    return ChecklistModel(
      id: map['id'],
      inicio: DateTime.fromMillisecondsSinceEpoch(map['inicio']),
      conclusao: DateTime.fromMillisecondsSinceEpoch(map['conclusao']),
      agendamento: AgendamentoModel.fromMap(map['agendamento']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChecklistModel.fromJson(String source) =>
      ChecklistModel.fromMap(json.decode(source));
}
