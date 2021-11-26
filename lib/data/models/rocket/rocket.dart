import 'dart:convert';

import 'package:equatable/equatable.dart';

class Rocket extends Equatable {
  final String rocketId;
  final String rocketName;
  final String rocketType;

  const Rocket({
    required this.rocketId,
    required this.rocketName,
    required this.rocketType,
  });

  @override
  List<Object?> get props => [rocketId, rocketName, rocketType];

  Map<String, dynamic> toMap() {
    return {
      'rocket_id': rocketId,
      'rocket_name': rocketName,
      'rocket_type': rocketType,
    };
  }

  factory Rocket.fromMap(Map<String, dynamic> map) {
    return Rocket(
      rocketId: map['rocket_id'],
      rocketName: map['rocket_name'],
      rocketType: map['rocket_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rocket.fromJson(String source) => Rocket.fromMap(json.decode(source));
}
