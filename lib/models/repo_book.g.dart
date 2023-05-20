// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LubAdapter extends TypeAdapter<Lub> {
  @override
  final int typeId = 0;

  @override
  Lub read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Lub(
      fullName: fields[1] as String,
      description: fields[2] as String,
      htmlUrl: fields[3] as String,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Lub obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.htmlUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LubAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
