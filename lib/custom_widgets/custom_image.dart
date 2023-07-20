import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    this.size,
    required this.url,
  });

  final String url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return _isLocalUri()
        ? Image.asset(
            Utils.getImagePath(url),
            height: size,
            width: size,
            fit: BoxFit.cover,
          )
        : CachedNetworkImage(
            height: size,
            width: size,
            fit: BoxFit.cover,
            imageUrl: url,
            progressIndicatorBuilder: (context, str, progress) {
              return CircularProgressIndicator();
            },
          );
  }

  bool _isLocalUri() {
    return url.startsWith("assets/");
  }
}
