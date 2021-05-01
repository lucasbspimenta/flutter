// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsuarioModelAdapter extends TypeAdapter<UsuarioModel> {
  @override
  final int typeId = 0;

  @override
  UsuarioModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsuarioModel(
      nome: fields[0] as String,
      matricula: fields[1] as String,
      foto: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UsuarioModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.matricula)
      ..writeByte(2)
      ..write(obj.foto);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsuarioModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
