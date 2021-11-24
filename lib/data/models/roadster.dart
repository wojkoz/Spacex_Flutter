import 'dart:convert';

import 'package:equatable/equatable.dart';

class Roadster extends Equatable {
  final String name;
  final int launchDateUnix;
  final int launchMassKg;
  final String orbitType;
  final double periodDays;
  final double speedKph;
  final double earthDistanceKm;
  final double marsDistanceKm;
  final String wikipedia;
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
