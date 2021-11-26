// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadster.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoadsterAdapter extends TypeAdapter<Roadster> {
  @override
  final int typeId = 0;

  @override
  Roadster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Roadster(
      name: fields[1] as String,
      launchDateUnix: fields[2] as int,
      launchMassKg: fields[3] as int,
      orbitType: fields[4] as String,
      periodDays: fields[5] as double,
      speedKph: fields[6] as double,
      earthDistanceKm: fields[7] as double,
      marsDistanceKm: fields[8] as double,
      wikipedia: fields[9] as String,
      details: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Roadster obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.launchDateUnix)
      ..writeByte(3)
      ..write(obj.launchMassKg)
      ..writeByte(4)
      ..write(obj.orbitType)
      ..writeByte(5)
      ..write(obj.periodDays)
      ..writeByte(6)
      ..write(obj.speedKph)
      ..writeByte(7)
      ..write(obj.earthDistanceKm)
      ..writeByte(8)
      ..write(obj.marsDistanceKm)
      ..writeByte(9)
      ..write(obj.wikipedia)
      ..writeByte(10)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoadsterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
