class ExternalUrls {
  final String spotify;

  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(dynamic json) {
    var spotify = json['spotify'];
    return ExternalUrls(spotify: spotify);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['spotify'] = spotify;
    return map;
  }
}
