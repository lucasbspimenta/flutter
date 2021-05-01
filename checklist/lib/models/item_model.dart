import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 1)
class ItemModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String nome;
  @HiveField(2)
  final String descricao;
  @HiveField(3)
  final bool foto;
  @HiveField(4)
  final ItemModel? itemPai;

  ItemModel({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.foto,
    this.itemPai,
  });
}
