import 'package:hive/hive.dart';

import 'agendamentotipo_model.dart';

part 'agendamento_model.g.dart';

@HiveType(typeId: 4)
class AgendamentoModel {
  @HiveField(0)
  final DateTime data;
  @HiveField(1)
  final String unidade;
  @HiveField(2)
  final int unidadeId;
  @HiveField(3)
  final bool concluido;
  @HiveField(4)
  final DateTime? dataConclusao;
  @HiveField(5)
  final AgendamentoTipoModel tipo;

  AgendamentoModel({
    required this.data,
    required this.unidade,
    required this.unidadeId,
    this.concluido = false,
    this.dataConclusao,
    required this.tipo,
  });
}
