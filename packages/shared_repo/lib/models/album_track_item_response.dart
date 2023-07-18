import 'ExternalUrls.dart';
import 'artist_response.dart';

class AlbumTrackItemResponse {
  List<ArtistResponse> artists;
  final int discNumber;
  final int durationMs;
  final bool explicit;
  ExternalUrls? externalUrls;
  final String href;
  final String id;
  final bool isLocal;
  final String name;
  final String? previewUrl;
  final int trackNumber;
  final String type;
  final String uri;

  AlbumTrackItemResponse({
    required this.artists,
    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.isLocal,
    required this.name,
    required this.previewUrl,
    required this.trackNumber,
    required this.type,
    required this.uri,
  });

  factory AlbumTrackItemResponse.fromJson(dynamic json) {
    var artists = <ArtistResponse>[];
    if (json['artists'] != null) {
      json['artists'].forEach((v) {
        artists.add(ArtistResponse.fromJson(v));
      });
    }
    var discNumber = json['disc_number'];
    var durationMs = json['duration_ms'];
    var explicit = json['explicit'];
    var externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    var href = json['href'];
    var id = json['id'];
    var isLocal = json['is_local'];
    var name = json['name'];
    var previewUrl = json['preview_url'];
    var trackNumber = json['track_number'];
    var type = json['type'];
    var uri = json['uri'];

    return AlbumTrackItemResponse(
      artists: artists,
      discNumber: discNumber,
      durationMs: durationMs,
      explicit: explicit,
      externalUrls: externalUrls,
      href: href,
      id: id,
      isLocal: isLocal,
      name: name,
      previewUrl: previewUrl,
      trackNumber: trackNumber,
      type: type,
      uri: uri,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['artists'] = artists.map((v) => v.toJson()).toList();
    map['disc_number'] = discNumber;
    map['duration_ms'] = durationMs;
    map['explicit'] = explicit;
    if (externalUrls != null) {
      map['external_urls'] = externalUrls?.toJson();
    }
    map['href'] = href;
    map['id'] = id;
    map['is_local'] = isLocal;
    map['name'] = name;
    map['preview_url'] = previewUrl;
    map['track_number'] = trackNumber;
    map['type'] = type;
    map['uri'] = uri;
    return map;
  }
}
