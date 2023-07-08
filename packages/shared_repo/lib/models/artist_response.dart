import 'package:shared_repo/models/image_response.dart';

class ArtistResponse {
  final String name;
  final String href;
  final String id;
  final List<ImageResponse> images;
  final List<String> genres;
  final String uri;

  ArtistResponse({
    required this.name,
    required this.href,
    required this.id,
    required this.uri,
    required this.images,
    required this.genres,
  });

  factory ArtistResponse.fromJson(Map<dynamic, dynamic> json) {
    var images = <ImageResponse>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(ImageResponse.fromJson(v));
      });
    }

    var genres = <String>[];
    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genres.add(v);
      });
    }
    return ArtistResponse(
      name: json["name"],
      href: json["href"],
      id: json["id"],
      genres: genres,
      uri: json["uri"],
      images: images,
    );
  }

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "href": href,
        "id": id,
        // "type": artistTypeValues.reverse[type],
        // "external_urls": externalUrls.toJson(),
        "uri": uri,
        "image": images.map((e) => e.toJson()),
      };
}