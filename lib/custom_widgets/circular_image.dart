import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.size,
    required this.url,
  });

  final String url;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        Utils.getImagePath(url),
        height: size,
        width: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
