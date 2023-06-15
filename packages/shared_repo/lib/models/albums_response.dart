import 'package:shared_repo/models/album_item_response.dart';

class AlbumsResponse {
  AlbumsResponse({
    required this.next,
    required this.total,
    required this.offset,
    required this.limit,
    required this.href,
    required this.items,
  });

  String next;
  int total;
  int offset;
  int limit;
  String href;
  List<AlbumItemResponse> items;

  factory AlbumsResponse.fromJson(Map<dynamic, dynamic> json) => AlbumsResponse(
    next: json["next"],
    total: json["total"],
    offset: json["offset"],
    limit: json["limit"],
    href: json["href"],
    items: List<AlbumItemResponse>.from(json["items"].map((x) => AlbumItemResponse.fromJson(x))),
  );

  Map<dynamic, dynamic> toJson() => {
    "next": next,
    "total": total,
    "offset": offset,
    "limit": limit,
    "href": href,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}