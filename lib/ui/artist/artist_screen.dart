import 'package:a_music_player_flutter/cubits/artists/artist_cubit.dart';
import 'package:a_music_player_flutter/utils/base/widgets/abstract_list_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repo/model_exports.dart';
import 'package:spotify_repo/spotify_repo.dart';

class ArtistScreen extends AbstractListItemScreen<ArtistResponse, ArtistCubit,
    ArtistState, List<ArtistResponse>> {
  static const String routeName = "/ArtistScreen";

  const ArtistScreen({super.key});

  @override
  ArtistCubit getCubit(BuildContext context) =>
      ArtistCubit(context.read<SpotifyRepo>());

  @override
  List<ArtistResponse> getItems(List<ArtistResponse> body) => body;

  @override
  Widget getListWidget(
    ArtistCubit cubit,
    BuildContext context,
    ArtistResponse item,
  ) => Container();
}
