import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_repo/model_exports.dart';

class AlbumTrackWidget extends StatelessWidget {
  const AlbumTrackWidget({
    super.key,
    required this.item,
  });

  final AlbumTrackItemResponse item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          item.name,
        ).padding(right: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tere Pyaar Mein",
            ).padding(bottom: 10),
            Text(
              "Pritam,Arijit Singh",
            )
          ],
        ).expanded(),
      ],
    ).paddingAll(20);
  }
}
