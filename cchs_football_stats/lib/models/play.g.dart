// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayAdapter extends TypeAdapter<Play> {
  @override
  final int typeId = 0;

  @override
  Play read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Play()
      ..name = fields[0] as String
      ..direction = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Play obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.direction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}