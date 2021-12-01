import 'dart:convert';

import 'package:equatable/equatable.dart';

class Mission extends Equatable {
  final String missionName;
  final String missionId;
  final List<String> manufacturers;
  final List<String> payloadIds;
  final String? wikipedia;
  final String? website;
  final String? twitter;
  final String description;

  const Mission(
      {required this.missionName,
      required this.missionId,
      required this.manufacturers,
      required this.payloadIds,
      this.wikipedia,
      this.website,
      this.twitter,
      required this.description});

  @override
  List<Object?> get props => [missionName, missionId, description];

  Map<String, dynamic> toMap() {
    return {
      'mission_name': missionName,
      'mission_id': missionId,
      'manufacturers': manufacturers,
      'payload_ids': payloadIds,
      'wikipedia': wikipedia,
      'website': website,
      'twitter': twitter,
      'description': description,
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      missionName: map['mission_name'],
      missionId: map['mission_id'],
      manufacturers: List<String>.from(map['manufacturers']),
      payloadIds: List<String>.from(map['payload_ids']),
      wikipedia: map['wikipedia'],
      website: map['website'],
      twitter: map['twitter'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Mission.fromJson(String source) =>
      Mission.fromMap(json.decode(source));
}
