import 'package:a_music_player_flutter/cubits/home/home_cubit.dart';
import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/home/widgets/album_item_widget.dart';
import 'package:a_music_player_flutter/utils/base/widgets/abstract_list_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repo/models/Items.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:spotify_repo/spotify_repo.dart';

class HomeScreen extends AbstractListItemScreen<Items,HomeCubit,HomeState,AlbumsResponse> {
  static const routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  HomeCubit getCubit(BuildContext context)  => HomeCubit(context.read<SpotifyRepo>());
  @override
  List<Items> getItems(AlbumsResponse body) => body.items;

  @override
  Widget getListWidget(HomeCubit cubit,BuildContext context, Items item) {
    return AlbumItemWidget(
      item:item,
      onColorGenerated: cubit.onColorGenerated,
      onClick: (Items item) {
        var color =  cubit.getGeneratedColor(item.id);
        context.read<PlayerCubit>().updateColor(color);
        Navigator.pushNamed(
          context,
          AlbumScreen.routeName,
          arguments: {
            "id": item.id,
            "color": color,
          },
        );
      },
      isColorFetched: (id) => cubit.isColorFetched(id),
    );
  }

}
