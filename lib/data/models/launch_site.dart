import 'dart:convert';

import 'package:equatable/equatable.dart';

class LaunchSite extends Equatable {
  String siteId;
  String siteName;
  String siteNameLong;

  LaunchSite(
      {required this.siteId,
      required this.siteName,
      required this.siteNameLong});

  @override
  List<Object?> get props => [siteId, siteName];

  Map<String, dynamic> toMap() {
    return {
      'site_id': siteId,
      'site_name': siteName,
      'site_name_long': siteNameLong,
    };
  }

  factory LaunchSite.fromMap(Map<String, dynamic> map) {
    return LaunchSite(
      siteId: map['site_id'],
      siteName: map['site_name'],
      siteNameLong: map['site_name_long'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LaunchSite.fromJson(String source) =>
      LaunchSite.fromMap(json.decode(source));
}
