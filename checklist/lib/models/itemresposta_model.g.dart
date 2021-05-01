// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemresposta_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RespostaValorAdapter extends TypeAdapter<RespostaValor> {
  @override
  final int typeId = 6;

  @override
  RespostaValor read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RespostaValor.na;
      case 1:
        return RespostaValor.conforme;
      case 2:
        return RespostaValor.inconforme;
      default:
        return RespostaValor.na;
    }
  }

  @override
  void write(BinaryWriter writer, RespostaValor obj) {
    switch (obj) {
      case RespostaValor.na:
        writer.writeByte(0);
        break;
      case RespostaValor.conforme:
        writer.writeByte(1);
        break;
      case RespostaValor.inconforme:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RespostaValorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemRepostaModelAdapter extends TypeAdapter<ItemRepostaModel> {
  @override
  final int typeId = 7;

  @override
  ItemRepostaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemRepostaModel(
      id: fields[0] as int,
      item: fields[1] as ItemModel,
      resposta: fields[2] as RespostaValor,
      foto: fields[3] as String?,
      checklist: fields[4] as ChecklistModel,
    );
  }

  @override
  void write(BinaryWriter writer, ItemRepostaModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.item)
      ..writeByte(2)
      ..write(obj.resposta)
      ..writeByte(3)
      ..write(obj.foto)
      ..writeByte(4)
      ..write(obj.checklist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemRepostaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
