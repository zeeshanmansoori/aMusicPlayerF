import 'package:shared_repo/models/artist_response.dart';

class TrackItemsResponse {
    final List<String> availableMarkets;
    // final ReleaseDatePrecision releaseDatePrecision;
    // final AlbumTypeEnum type;
    final String uri;
    final List<ArtistResponse> artists;
    final String name;
    // final AlbumTypeEnum albumType;
    final String href;
    final String id;

    TrackItemsResponse({
        required this.availableMarkets,
        // required this.releaseDatePrecision,
        // required this.type,
        required this.uri,
        required this.artists,
        required this.name,
        // required this.albumType,
        required this.href,
        required this.id,
    });


    factory TrackItemsResponse.fromJson(Map<dynamic, dynamic> json){
        return TrackItemsResponse(
          availableMarkets:
              List<String>.from(json["available_markets"].map((x) => x)),
          // releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
          // type: albumTypeEnumValues.map[json["type"]]!,
          uri: json["uri"],
          artists: List<ArtistResponse>.from(
              json["artists"].map((x) => ArtistResponse.fromJson(x))),

          name: json["name"],
          // albumType: albumTypeEnumValues.map[json["album_type"]]!,
          href: json["href"],
          id: json["id"],
        );
      }

    Map<dynamic, dynamic> toJson() => {
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        // "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        // "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "name": name,
        // "album_type": albumTypeEnumValues.reverse[albumType],
        "href": href,
        "id": id,
        // "external_urls": externalUrls.toJson(),
    };

    @override
  String toString() {
    return 'TrackItemsResponse{uri: $uri, artists: $artists, name: $name, href: $href, id: $id}';
  }
}