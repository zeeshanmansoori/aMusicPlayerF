import 'package:a_music_player_flutter/cubits/albums/albums_cubit.dart';
import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/home/widgets/album_item_widget.dart';
import 'package:a_music_player_flutter/utils/base/widgets/abstract_list_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repo/models/Items.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:spotify_repo/spotify_repo.dart';

class AlbumsScreen extends AbstractListItemScreen<AlbumItems,AlbumsCubit,AlbumsState,AlbumsResponse> {
  static const routeName = "/AlbumsScreen";
  const AlbumsScreen({super.key});

  @override
  AlbumsCubit getCubit(BuildContext context)  => AlbumsCubit(context.read<SpotifyRepo>());
  @override
  List<AlbumItems> getItems(AlbumsResponse body) => body.items;

  @override
  Widget getListWidget(AlbumsCubit cubit,BuildContext context, AlbumItems item) {
    return AlbumItemWidget(
      item:item,
      onClick: (AlbumItems item) {
        Navigator.pushNamed(
          context,
          AlbumScreen.routeName,
          arguments: {
            "id": item.id,
            "color": context.read<PlayerCubit>().getAlbumColorAndSetPrimaryColor(item.id),
          },
        );
      },
      // isColorFetched: (id) => cubit.isColorFetched(id),
    );
  }

}