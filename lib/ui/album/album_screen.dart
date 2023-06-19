import 'package:a_music_player_flutter/cubits/album/album_cubit.dart';
import 'package:a_music_player_flutter/custom_widgets/circular_image.dart';
import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  static const String routeName = "/albumScreen";

  @override
  Widget build(BuildContext context) {
    var albumId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (BuildContext context) => AlbumCubit(context.read<ApiClient>(),albumId),
      child: BlocBuilder<AlbumCubit, AlbumState>(
        builder: (context, state) {
          if (state.apiStatus.isInProgress) {
            return const CircularProgressIndicator().wrapCenter();
          }
          var album = state.data;
          if (album == null) return Text(state.msg ?? "").wrapCenter();
          // var size = MediaQuery.of(context).size;

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColors.colorPrimary,
                  Colors.black87,
                ],
              ),
            ),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 100,
                              blurStyle: BlurStyle.outer,
                            )
                          ],
                        ),
                        child: Image.asset(
                          height: 200,
                          width: 200,
                          Utils.getImagePath("music_2"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            album.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              CircularImage(
                                url: album.images.first.url,
                                size: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: album.artists.first.name,
                                  children: [
                                    TextSpan(
                                      text:
                                          " • ${album.releaseDate} • ${album.totalTracks} songs, ",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: album.tracks?.items.fold(
                                        "",
                                        (previousValue, element) =>
                                            element.totalTracks.toString() +
                                            previousValue!,
                                      ),
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(.5),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ).padding(left: 5)
                            ],
                          ).padding(top: 10),
                        ],
                      ).paddingAll(20).expanded()
                    ],
                  ).paddingAll(20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
