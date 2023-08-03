import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/ui/artist/artist_screen.dart';
import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repo/models/artist_response.dart';

class ArtistItemWidget extends StatelessWidget {
  const ArtistItemWidget({
    super.key,
    required this.artist,
  });

  final ArtistResponse artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: CachedNetworkImageProvider(artist.images.first.url),
                fit: BoxFit.cover,
              ),
              boxShadow: [BoxShadow()]),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.black.withOpacity(.5),
              ),
              Image.asset(
                Utils.getImagePath("music_artist"),
                height: 60,
                width: 60,
              ),
            ],
          ),
        ).expanded(),
        Text(artist.name).padding(top: 10)
      ],
    ).paddingWithSymmetry(vertical: 10).asButton(
          onClick: () {
            Navigator.of(context).pushNamed(ArtistScreen.routeName, arguments: {
              "artist": artist,
              "color": context.read<PlayerCubit>().getPrimaryColorInt(),
            });
          },
          radius: const BorderRadius.all(
            Radius.circular(20),
          ),
        );
  }
}
