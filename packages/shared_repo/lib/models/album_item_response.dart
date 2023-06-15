import 'package:shared_repo/models/artist_response.dart';

class AlbumItemResponse {
    final List<Image> images;
    final List<String> availableMarkets;
    final ReleaseDatePrecision releaseDatePrecision;
    final AlbumTypeEnum type;
    final String uri;
    final int totalTracks;
    final List<ArtistResponse> artists;
    final DateTime releaseDate;
    final String name;
    final AlbumTypeEnum albumType;
    final String href;
    final String id;

    AlbumItemResponse({
        required this.images,
        required this.availableMarkets,
        required this.releaseDatePrecision,
        required this.type,
        required this.uri,
        required this.totalTracks,
        required this.artists,
        required this.releaseDate,
        required this.name,
        required this.albumType,
        required this.href,
        required this.id,
    });



    factory AlbumItemResponse.fromJson(Map<dynamic, dynamic> json) => AlbumItemResponse(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        availableMarkets: List<String>.from(json["available_markets"].map((x) => x)),
        releaseDatePrecision: releaseDatePrecisionValues.map[json["release_date_precision"]]!,
        type: albumTypeEnumValues.map[json["type"]]!,
        uri: json["uri"],
        totalTracks: json["total_tracks"],
        artists: List<ArtistResponse>.from(json["artists"].map((x) => ArtistResponse.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        name: json["name"],
        albumType: albumTypeEnumValues.map[json["album_type"]]!,
        href: json["href"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "release_date_precision": releaseDatePrecisionValues.reverse[releaseDatePrecision],
        "type": albumTypeEnumValues.reverse[type],
        "uri": uri,
        "total_tracks": totalTracks,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "name": name,
        "album_type": albumTypeEnumValues.reverse[albumType],
        "href": href,
        "id": id,
        // "external_urls": externalUrls.toJson(),
    };
}


enum AlbumTypeEnum { ALBUM, SINGLE }

final albumTypeEnumValues = EnumValues({
    "album": AlbumTypeEnum.ALBUM,
    "single": AlbumTypeEnum.SINGLE
});


class Image {
    Image({
        required this.width,
        required this.url,
        required this.height,
    });

    int width;
    String url;
    int height;

    factory Image.fromJson(Map<dynamic, dynamic> json) => Image(
        width: json["width"],
        url: json["url"],
        height: json["height"],
    );

    Map<dynamic, dynamic> toJson() => {
        "width": width,
        "url": url,
        "height": height,
    };
}

enum ReleaseDatePrecision { DAY }

final releaseDatePrecisionValues = EnumValues({
    "day": ReleaseDatePrecision.DAY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
