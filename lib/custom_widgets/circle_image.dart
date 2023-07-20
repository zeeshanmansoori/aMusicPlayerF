import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
    this.size,
    required this.url,
  });

  final String url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: _isLocalUri()
          ? Image.asset(
              url,
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
            ),
    );
  }

  bool _isLocalUri() {
    return url.startsWith("assets/");
  }
}
