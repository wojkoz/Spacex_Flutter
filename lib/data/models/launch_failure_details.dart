import 'dart:convert';

import 'package:equatable/equatable.dart';

class LaunchFailureDetails extends Equatable {
  final int time;
  final int? altitude;
  final String reason;

  const LaunchFailureDetails(
      {required this.time, this.altitude, required this.reason});

  @override
  List<Object?> get props => [time, reason, altitude];

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'altitude': altitude,
      'reason': reason,
    };
  }

  factory LaunchFailureDetails.fromMap(Map<String, dynamic> map) {
    return LaunchFailureDetails(
      time: map['time'],
      altitude: map['altitude'],
      reason: map['reason'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LaunchFailureDetails.fromJson(String source) =>
      LaunchFailureDetails.fromMap(json.decode(source));
}
