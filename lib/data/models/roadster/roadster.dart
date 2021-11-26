import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'roadster.g.dart';

@HiveType(typeId: 0)
class Roadster extends Equatable {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int launchDateUnix;
  @HiveField(3)
  final int launchMassKg;
  @HiveField(4)
  final String orbitType;
  @HiveField(5)
  final double periodDays;
  @HiveField(6)
  final double speedKph;
  @HiveField(7)
  final double earthDistanceKm;
  @HiveField(8)
  final double marsDistanceKm;
  @HiveField(9)
  final String wikipedia;
  @HiveField(10)
  final String details;

  const Roadster(
      {required this.name,
      required this.launchDateUnix,
      required this.launchMassKg,
      required this.orbitType,
      required this.periodDays,
      required this.speedKph,
      required this.earthDistanceKm,
      required this.marsDistanceKm,
      required this.wikipedia,
      required this.details});

  @override
  List<Object?> get props =>
      [name, periodDays, speedKph, earthDistanceKm, marsDistanceKm, details];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'launchDateUnix': launchDateUnix,
      'launchMassKg': launchMassKg,
      'orbitType': orbitType,
      'periodDays': periodDays,
      'speedKph': speedKph,
      'earthDistanceKm': earthDistanceKm,
      'marsDistanceKm': marsDistanceKm,
      'wikipedia': wikipedia,
      'details': details,
    };
  }

  factory Roadster.fromMap(Map<String, dynamic> map) {
    return Roadster(
      name: map['name'],
      launchDateUnix: map['launch_date_unix'],
      launchMassKg: map['launch_mass_kg'],
      orbitType: map['orbit_type'],
      periodDays: map['period_days'],
      speedKph: map['speed_kph'],
      earthDistanceKm: map['earth_distance_km'],
      marsDistanceKm: map['mars_distance_km'],
      wikipedia: map['wikipedia'],
      details: map['details'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Roadster.fromJson(String source) =>
      Roadster.fromMap(json.decode(source));
}
