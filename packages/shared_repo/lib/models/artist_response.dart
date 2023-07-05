import 'package:shared_repo/models/image_response.dart';

class ArtistResponse {
  final String name;
  final String href;
  final String id;
  final List<ImageResponse> images;
  final String uri;

  ArtistResponse({
    required this.name,
    required this.href,
    required this.id,
    required this.uri,
    required this.images,
  });

  factory ArtistResponse.fromJson(Map<dynamic, dynamic> json) {
    var images = <ImageResponse>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(ImageResponse.fromJson(v));
      });
    }
    return ArtistResponse(
      name: json["name"],
      href: json["href"],
      id: json["id"],
      // type: artistTypeValues.map[json["type"]]!,
      // externalUrls: ExternalUrls.fromJson(json["external_urls"]),
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