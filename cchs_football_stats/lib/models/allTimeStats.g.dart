// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allTimeStats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllTimeStatsAdapter extends TypeAdapter<AllTimeStats> {
  @override
  final int typeId = 3;

  @override
  AllTimeStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllTimeStats()
      ..allCombos = (fields[0] as List).cast<Combo>()
      ..seasonCombos = (fields[1] as List).cast<Combo>()
      ..revealedCombos = (fields[3] as List).cast<Combo>();
  }

  @override
  void write(BinaryWriter writer, AllTimeStats obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.allCombos)
      ..writeByte(1)
      ..write(obj.seasonCombos)
      ..writeByte(3)
      ..write(obj.revealedCombos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllTimeStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
