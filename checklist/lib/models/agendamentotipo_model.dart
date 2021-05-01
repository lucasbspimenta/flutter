import 'package:hive/hive.dart';

part 'agendamentotipo_model.g.dart';

@HiveType(typeId: 3)
class AgendamentoTipoModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nome;
  @HiveField(2)
  final String cor;

  AgendamentoTipoModel({
    required this.id,
    required this.nome,
    required this.cor,
  });
}
