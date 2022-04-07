// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonAdapter extends TypeAdapter<Season> {
  @override
  final int typeId = 2;

  @override
  Season read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Season()
      ..years = fields[0] as String
      ..games = (fields[1] as List).cast<Game>()
      ..totalGames = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, Season obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.years)
      ..writeByte(1)
      ..write(obj.games)
      ..writeByte(2)
      ..write(obj.totalGames);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
