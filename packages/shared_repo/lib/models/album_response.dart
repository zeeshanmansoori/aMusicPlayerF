import 'package:shared_repo/models/Restrictions.dart';
import 'package:shared_repo/models/artist_response.dart';
import 'package:shared_repo/models/image_response.dart';

import 'ExternalUrls.dart';
import 'Tracks.dart';

class AlbumResponse {
  AlbumResponse({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.restrictions,
    required this.type,
    required this.uri,
    // required this.copyrights,
    // required this.externalIds,
    required this.genres,
    required this.label,
    required this.popularity,
    required this.artists,
    required this.tracks,
  });

  factory AlbumResponse.fromJson(dynamic json) {
    var albumType = json['album_type'];
    var totalTracks = json['total_tracks'];
    var availableMarkets = json['available_markets'] != null
        ? json['available_markets'].cast<String>()
        : [];
    var externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    var href = json['href'];
    var id = json['id'];
    var images = <ImageResponse>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(ImageResponse.fromJson(v));
      });
    }
    var name = json['name'];
    var releaseDate = json['release_date'];
    var releaseDatePrecision = json['release_date_precision'];
    var restrictions = json['restrictions'] != null
        ? Restrictions.fromJson(json['restrictions'])
        : null;
    var type = json['type'];
    var uri = json['uri'];
    // var copyrights = [];
    // if (json['copyrights'] != null) {
    //
    //   json['copyrights'].forEach((v) {
    //     copyrights.add(Copyrights.fromJson(v));
    //   });
    // }
    //var externalIds = json['external_ids'] != null ? ExternalIds.fromJson(json['external_ids']) : null;
    var genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    var label = json['label'];
    var popularity = json['popularity'];
    var artists = <ArtistResponse>[];
    if (json['artists'] != null) {
      json['artists'].forEach((v) {
        artists.add(ArtistResponse.fromJson(v));
      });
    }
    var tracks =
        json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null;
    return AlbumResponse(
      albumType: albumType,
      totalTracks: totalTracks,
      availableMarkets: availableMarkets,
      externalUrls: externalUrls,
      href: href,
      id: id,
      images: images,
      name: name,
      releaseDate: releaseDate,
      releaseDatePrecision: releaseDatePrecision,
      restrictions: restrictions,
      type: type,
      uri: uri,
      genres: genres,
      label: label,
      popularity: popularity,
      artists: artists,
      tracks: tracks,
    );
  }

  String albumType;
  int totalTracks;
  List<String> availableMarkets;
  ExternalUrls? externalUrls;
  String href;
  String id;
  List<ImageResponse> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  Restrictions? restrictions;
  String type;
  String uri;

  //List<Copyrights> copyrights;
  // ExternalIds externalIds;
  List<String> genres;
  String label;
  int popularity;
  List<ArtistResponse> artists;
  Tracks? tracks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['album_type'] = albumType;
    map['total_tracks'] = totalTracks;
    map['available_markets'] = availableMarkets;
    if (externalUrls != null) {
      map['external_urls'] = externalUrls!.toJson();
    }
    map['href'] = href;
    map['id'] = id;
    map['images'] = images.map((v) => v.toJson()).toList();
    map['name'] = name;
    map['release_date'] = releaseDate;
    map['release_date_precision'] = releaseDatePrecision;
    map['restrictions'] = restrictions?.toJson();
    map['type'] = type;
    map['uri'] = uri;
    // if (copyrights != null) {
    //   map['copyrights'] = copyrights.map((v) => v.toJson()).toList();
    // }
    // if (externalIds != null) {
    //   map['external_ids'] = externalIds.toJson();
    // }
    map['genres'] = genres;
    map['label'] = label;
    map['popularity'] = popularity;
    map['artists'] = artists.map((v) => v.toJson()).toList();
    map['tracks'] = tracks?.toJson();
    return map;
  }
}
