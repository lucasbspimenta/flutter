import 'package:hive/hive.dart';

import 'package:checklist/models/checklist_model.dart';
import 'package:checklist/models/item_model.dart';

part 'itemresposta_model.g.dart';

@HiveType(typeId: 6)
enum RespostaValor {
  @HiveField(0)
  na,

  @HiveField(1)
  conforme,

  @HiveField(2)
  inconforme,
}

@HiveType(typeId: 7)
class ItemRepostaModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final ItemModel item;
  @HiveField(2)
  final RespostaValor resposta;
  @HiveField(3)
  final String? foto;
  @HiveField(4)
  final ChecklistModel checklist;

  ItemRepostaModel({
    required this.id,
    required this.item,
    required this.resposta,
    this.foto,
    required this.checklist,
  });
}
