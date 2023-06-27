import 'package:shared_repo/model_exports.dart';

class Tracks {
  Tracks({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
    required this.items,
  });

  factory Tracks.fromJson(dynamic json) {
    var href = json['href'];
    var limit = json['limit'];
    var next = json['next'];
    var offset = json['offset'];
    var previous = json['previous'];
    var total = json['total'];
    var items = <AlbumTrackItemResponse>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(AlbumTrackItemResponse.fromJson(v));
      });
    }
    return Tracks(
      href: href,
      limit: limit,
      next: next,
      offset: offset,
      previous: previous,
      total: total,
      items: items,
    );
  }

  String href;
  int limit;
  String? next;
  int offset;
  String? previous;
  int total;
  List<AlbumTrackItemResponse> items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    map['limit'] = limit;
    map['next'] = next;
    map['offset'] = offset;
    map['previous'] = previous;
    map['total'] = total;
    map['items'] = items.map((v) => v.toJson()).toList();
    return map;
  }

}