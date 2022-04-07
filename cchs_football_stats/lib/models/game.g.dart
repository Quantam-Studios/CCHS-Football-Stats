// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 1;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game()
      ..opponent = fields[0] as String
      ..plays = (fields[1] as List).cast<Play>()
      ..away = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.opponent)
      ..writeByte(1)
      ..write(obj.plays)
      ..writeByte(2)
      ..write(obj.away);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
