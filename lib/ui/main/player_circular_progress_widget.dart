import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/custom_widgets/circle_image.dart';
import 'package:a_music_player_flutter/ui/player/widgets/player_thumbnail_widget.dart';
import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_sdk/models/image_uri.dart';

class PlayerCircularProgressWidget extends StatelessWidget {
  const PlayerCircularProgressWidget({
    super.key,
    required this.size,
    this.image,
  });

  final double size;
  final ImageUri? image;

  @override
  Widget build(BuildContext context) {
    var innerPadding = 10;
    return Stack(
      alignment: Alignment.center,
      children: [

        BlocBuilder<PlayerCubit, PlayerState>(
          buildWhen: (p, c) => p.progress!=c.progress,
          builder: (context, state) {

            return SizedBox(
              height: size,
              width: size,
              child: CircularProgressIndicator(
                value: state.progress,
                strokeWidth: 2,
                color: state.primaryColor,
              ),
            );
          },
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          height: size - innerPadding,
          width: size - innerPadding,
          child: image == null ? CircleImage(
            url: Utils.getImagePath("music_1"),
            size: size - innerPadding,
          ) : PlayerThumbnailStaticWidget.spotifyImageWidget(image!),
        ),
      ],
    );
  }
}
