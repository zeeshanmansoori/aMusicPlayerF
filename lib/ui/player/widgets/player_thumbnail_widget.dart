import 'dart:typed_data';

import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_sdk/models/image_uri.dart';
import 'package:spotify_sdk/models/track.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class PlayerThumbnailWidget extends StatefulWidget {
  const PlayerThumbnailWidget({
    super.key,
    this.track,
  });

  final Track? track;

  @override
  State<PlayerThumbnailWidget> createState() => _PlayerThumbnailWidgetState();

  static Widget getPlayerThumbnailWithBloc() {
    return BlocBuilder<PlayerCubit, PlayerState>(
      buildWhen: (p, c) => p.track != c.track,
      builder: (context, state) {
        return PlayerThumbnailWidget(track: state.track);
      },
    );
  }
}

class _PlayerThumbnailWidgetState extends State<PlayerThumbnailWidget> {
  late double sizePercent;
  late double _borderRadius;
  late double _blurRadius;
  late Color _color;

  _PlayerThumbnailWidgetState() {
    updateState(false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * sizePercent;
    Widget imageWidget;
    if (widget.track == null) {
      imageWidget = Container(
        color: Colors.redAccent,
      );
    }
    imageWidget = spotifyImageWidget(widget.track!.imageUri);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          // color: _color,
          borderRadius: BorderRadius.circular(_borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: _blurRadius,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.asset(
          Utils.getImagePath("music_2"),
          fit: BoxFit.cover,
        ),
      ).asGestureButton(
        onLongPressDown: (d) {
          animateNUpdateState(true);
        },
        onLongPressUp: () {
          animateNUpdateState(false);
        },
      ),
    );
  }

  void animateNUpdateState(
    bool start,
  ) {
    setState(() {
      updateState(start);
    });
  }

  void updateState(bool start) {
    _color = start ? Colors.green : Colors.greenAccent;
    sizePercent = start ? 0.7 : 0.8;
    _borderRadius = start ? 14 : 12;
    _blurRadius = start ? 2 : 1.5;
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
