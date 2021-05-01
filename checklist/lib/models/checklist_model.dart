import 'package:hive/hive.dart';

import 'package:checklist/models/agendamento_model.dart';

part 'checklist_model.g.dart';

@HiveType(typeId: 5)
class ChecklistModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final DateTime inicio;
  @HiveField(2)
  final DateTime? conclusao;
  @HiveField(3)
  final AgendamentoModel agendamento;

  ChecklistModel({
    required this.id,
    required this.inicio,
    this.conclusao,
    required this.agendamento,
  });
}
