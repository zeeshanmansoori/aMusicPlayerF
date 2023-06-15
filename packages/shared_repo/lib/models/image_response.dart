class ImageResponse {
  ImageResponse({
    required this.width,
    required this.url,
    required this.height,
  });

  int width;
  String url;
  int height;

  factory ImageResponse.fromJson(Map<dynamic, dynamic> json) => ImageResponse(
    width: json["width"],
    url: json["url"],
    height: json["height"],
  );

  Map<dynamic, dynamic> toJson() => {
    "width": width,
    "url": url,
    "height": height,
  };

  @override
  String toString() {
    return 'Image{width: $width, url: $url, height: $height}';
  }
}