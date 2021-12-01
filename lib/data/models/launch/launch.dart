import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:spacex_flutter/data/models/links/links.dart';
import 'package:spacex_flutter/data/models/rocket/rocket.dart';

import 'launch_failure_details.dart';
import 'launch_site.dart';

class Launch extends Equatable {
  final int flightNumber;
  final String missionName;
  final List<String> missionId;
  final bool upcoming;
  final String launchYear;
  final int launchDateUnix;
  final Rocket rocket;
  final LaunchSite launchSite;
  final bool? launchSuccess;
  final LaunchFailureDetails? launchFailureDetails;
  final Links links;
  final String? details;

  const Launch({
    required this.flightNumber,
    required this.missionName,
    required this.missionId,
    required this.upcoming,
    required this.launchYear,
    required this.launchDateUnix,
    required this.rocket,
    required this.launchSite,
    this.launchSuccess,
    this.launchFailureDetails,
    required this.links,
    this.details,
  });

  @override
  List<Object?> get props =>
      [flightNumber, missionName, launchYear, links, details, launchDateUnix];

  Map<String, dynamic> toMap() {
    return {
      'flight_number': flightNumber,
      'mission_name': missionName,
      'mission_id': missionId,
      'upcoming': upcoming,
      'launch_year': launchYear,
      'launch_date_unix': launchDateUnix,
      'rocket': rocket.toMap(),
      'launch_site': launchSite.toMap(),
      'launch_success': launchSuccess,
      'launch_failure_details': launchFailureDetails?.toMap(),
      'links': links.toMap(),
      'details': details,
    };
  }

  factory Launch.fromMap(Map<String, dynamic> map) {
    return Launch(
      flightNumber: map['flight_number'],
      missionName: map['mission_name'],
      missionId: List<String>.from(map['mission_id']),
      upcoming: map['upcoming'],
      launchYear: map['launch_year'],
      launchDateUnix: map['launch_date_unix'],
      rocket: Rocket.fromMap(map['rocket']),
      launchSite: LaunchSite.fromMap(map['launch_site']),
      launchSuccess: map['launch_success'],
      launchFailureDetails: map['launch_failure_details'] != null
          ? LaunchFailureDetails.fromMap(map['launch_failure_details'])
          : null,
      links: Links.fromMap(map['links']),
      details: map['details'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Launch.fromJson(String source) => Launch.fromMap(json.decode(source));
}
