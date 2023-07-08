import 'dart:math';

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
          item.trackNumber.toString(),
          style: TextStyle(
            color: Colors.white.withOpacity(.8),
          ),
        ).padding(right: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              maxLines: 1,
            ).padding(bottom: 5),
            Text(
              getArtistsNames(),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white.withOpacity(.8),
              ),
            )
          ],
        ).expanded(),
      ],
    ).paddingWithSymmetry(
      horizontal: 20,
      vertical: 10,
    );
  }

  String getArtistsNames() {
    var str = "";
    var index = 0;
    item.artists.sublist(0, min(2, item.artists.length)).forEach((element) {
      if (index == 0) {
        str = element.name;
      } else {
        str = "$str,${element.name}";
      }

      index++;
    });

    return str;
  }
}
