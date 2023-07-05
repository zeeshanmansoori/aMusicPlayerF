import 'dart:ui';

import 'package:a_music_player_flutter/cubits/album/album_cubit.dart';
import 'package:a_music_player_flutter/custom_widgets/circular_image.dart';
import 'package:a_music_player_flutter/ui/album/widgets/album_track_widget.dart';
import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_repo/spotify_repo.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  static const String routeName = "/albumScreen";

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    var albumId = args["id"].toString();
    var bgColor = args["color"] == null
        ? CustomColors.colorPrimary
        : Color(args["color"] as int);

    return BlocProvider(
      create: (BuildContext context) =>
          AlbumCubit(context.read<SpotifyRepo>(), albumId),
      child: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state.apiResult.isLoading) {
            return const CircularProgressIndicator().wrapCenter();
          }
          var album = state.apiResult.body;
          if (album == null) return Text(state.msg ?? "").wrapCenter();
          // var size = MediaQuery.of(context).size;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  bgColor,
                  Colors.black87,
                ],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                blurStyle: BlurStyle.outer,
                              )
                            ],
                          ),
                          child: CustomImage(
                            url: album.images.first.url,
                            size: 180,
                          ),
                        ).expanded(flex: 45),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              album.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                CustomImage(
                                  url: album.images.first.url,
                                  size: 20,
                                ).padding(right: 5),
                                RichText(
                                  overflow: TextOverflow.visible,
                                  text: TextSpan(
                                    text: album.artists.first.name,
                                    children: [
                                      TextSpan(
                                        text: "• ${album.totalTracks} Songs",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      // TextSpan(
                                      //   text: album.tracks?.total.toString(),
                                      //   style: TextStyle(
                                      //     color: Colors.white.withOpacity(.5),
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                    ],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ).expanded()
                              ],
                            ).padding(top: 10),
                          ],
                        )
                            .paddingWithSymmetry(horizontal: 20)
                            .expanded(flex: 55),
                      ],
                    ).paddingAll(20),
                  ),
                  Positioned(
                    top: 220,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 15,
                          sigmaY: 15,
                        ),
                        child: ListView(
                          children: album.tracks!.items
                              .map((e) => AlbumTrackWidget(item: e))
                              .toList(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
