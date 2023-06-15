import 'ExternalUrls.dart';

class LinkedFrom {
  LinkedFrom({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
  });

  factory LinkedFrom.fromJson(dynamic json) {
    var externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    var href = json['href'];
    var id = json['id'];
    var type = json['type'];
    var uri = json['uri'];
    return LinkedFrom(
      externalUrls: externalUrls,
      href: href,
      id: id,
      type: type,
      uri: uri,
    );
  }

  ExternalUrls? externalUrls;
  String href;
  String id;
  String type;
  String uri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (externalUrls != null) {
      map['external_urls'] = externalUrls?.toJson();
    }
    map['href'] = href;
    map['id'] = id;
    map['type'] = type;
    map['uri'] = uri;
    return map;
  }
}
