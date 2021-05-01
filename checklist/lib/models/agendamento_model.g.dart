// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamento_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgendamentoModelAdapter extends TypeAdapter<AgendamentoModel> {
  @override
  final int typeId = 4;

  @override
  AgendamentoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AgendamentoModel(
      data: fields[0] as DateTime,
      unidade: fields[1] as String,
      unidadeId: fields[2] as int,
      concluido: fields[3] as bool,
      dataConclusao: fields[4] as DateTime?,
      tipo: fields[5] as AgendamentoTipoModel,
    );
  }

  @override
  void write(BinaryWriter writer, AgendamentoModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.unidade)
      ..writeByte(2)
      ..write(obj.unidadeId)
      ..writeByte(3)
      ..write(obj.concluido)
      ..writeByte(4)
      ..write(obj.dataConclusao)
      ..writeByte(5)
      ..write(obj.tipo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgendamentoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
