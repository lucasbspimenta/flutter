import 'package:hive/hive.dart';

part 'usuario_model.g.dart';

@HiveType(typeId: 0)
class UsuarioModel {
  @HiveField(0)
  final String nome;
  @HiveField(1)
  final String matricula;
  @HiveField(2)
  final String? foto;

  UsuarioModel({
    required this.nome,
    required this.matricula,
    this.foto,
  });
}
