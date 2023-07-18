import 'dart:typed_data';

import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/track.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class PlayerThumbnailStaticWidget extends StatelessWidget {
  const PlayerThumbnailStaticWidget({
    super.key,
    required this.track,
  });

  final Track? track;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width - 50;
    Widget imageWidget;
    if (track == null) {
      imageWidget = Container(
        color: Colors.redAccent,
      );
    }
    imageWidget = spotifyImageWidget(track!.imageUri);
    var borderRadius = 12.0;
    var blurRadius = 2.0;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        // color: _color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            blurRadius: blurRadius,
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: imageWidget,
    ).asGestureButton();
  }

  Widget spotifyImageWidget(ImageUri image) {
    return FutureBuilder(
        future: SpotifySdk.getImage(
          imageUri: image,
          dimension: ImageDimension.large,
        ),
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasData) {
            return Image.memory(snapshot.data!);
          } else if (snapshot.hasError) {
            return SizedBox(
              width: ImageDimension.large.value.toDouble(),
              height: ImageDimension.large.value.toDouble(),
              child: const Center(child: Text('Error getting image')),
            );
          } else {
            return SizedBox(
              width: ImageDimension.large.value.toDouble(),
              height: ImageDimension.large.value.toDouble(),
              child: const Center(child: Text('Getting image...')),
            );
          }
        });
  }
}