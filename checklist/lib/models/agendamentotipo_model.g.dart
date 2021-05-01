// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agendamentotipo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgendamentoTipoModelAdapter extends TypeAdapter<AgendamentoTipoModel> {
  @override
  final int typeId = 3;

  @override
  AgendamentoTipoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AgendamentoTipoModel(
      id: fields[0] as int,
      nome: fields[1] as String,
      cor: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AgendamentoTipoModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.cor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgendamentoTipoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
