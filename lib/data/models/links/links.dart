import 'dart:convert';

import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String? missionPatch;
  final String? missionPatchSmall;
  final String? articleLink;
  final String? wikipedia;
  final String? videoLink;
  final String? youtubeId;
  final List<String> flickrImages;

  const Links(
      {this.missionPatch,
      this.missionPatchSmall,
      this.articleLink,
      this.wikipedia,
      this.videoLink,
      this.youtubeId,
      required this.flickrImages});

  @override
  List<Object?> get props => [missionPatch, articleLink, wikipedia];

  Map<String, dynamic> toMap() {
    return {
      'mission_patch': missionPatch,
      'mission_patch_small': missionPatchSmall,
      'article_link': articleLink,
      'wikipedia': wikipedia,
      'video_link': videoLink,
      'youtube_id': youtubeId,
      'flickr_images': flickrImages,
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      missionPatch: map['mission_patch'],
      missionPatchSmall: map['mission_patch_small'],
      articleLink: map['article_link'],
      wikipedia: map['wikipedia'],
      videoLink: map['video_link'],
      youtubeId: map['youtube_id'],
      flickrImages: map['flickr_images'] != null
          ? List<String>.from(map['flickr_images'])
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));
}
