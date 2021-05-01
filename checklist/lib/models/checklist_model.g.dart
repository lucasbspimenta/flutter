// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChecklistModelAdapter extends TypeAdapter<ChecklistModel> {
  @override
  final int typeId = 5;

  @override
  ChecklistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChecklistModel(
      id: fields[0] as int,
      inicio: fields[1] as DateTime,
      conclusao: fields[2] as DateTime?,
      agendamento: fields[3] as AgendamentoModel,
    );
  }

  @override
  void write(BinaryWriter writer, ChecklistModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.inicio)
      ..writeByte(2)
      ..write(obj.conclusao)
      ..writeByte(3)
      ..write(obj.agendamento);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChecklistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
