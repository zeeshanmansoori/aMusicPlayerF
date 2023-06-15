class ArtistResponse {
  ArtistResponse({
    required this.name,
    required this.href,
    required this.id,
    // required this.type,
    // required this.externalUrls,
    required this.uri,
  });

  String name;
  String href;
  String id;
  // ArtistType type;
  // ExternalUrls externalUrls;
  String uri;

  factory ArtistResponse.fromJson(Map<dynamic, dynamic> json) => ArtistResponse(
    name: json["name"],
    href: json["href"],
    id: json["id"],
    // type: artistTypeValues.map[json["type"]]!,
    // externalUrls: ExternalUrls.fromJson(json["external_urls"]),
    uri: json["uri"],
  );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "href": href,
    "id": id,
    // "type": artistTypeValues.reverse[type],
    // "external_urls": externalUrls.toJson(),
    "uri": uri,
  };
}