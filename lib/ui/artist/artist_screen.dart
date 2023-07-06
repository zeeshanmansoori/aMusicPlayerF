import 'package:a_music_player_flutter/cubits/artists/artist_cubit.dart';
import 'package:a_music_player_flutter/ui/artist/widgets/artist_item_widget.dart';
import 'package:a_music_player_flutter/utils/base/widgets/abstract_list_item_screen.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_repo/model_exports.dart';
import 'package:spotify_repo/spotify_repo.dart';

class ArtistScreen extends StatelessWidget {
  static const String routeName = "/ArtistScreen";

  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ArtistCubit(context.read<SpotifyRepo>()),
      child: Scaffold(
        body: BlocBuilder<ArtistCubit, ArtistState>(
          builder: (context, state) {
            var cubit = context.read<ArtistCubit>();
            if (state.apiResult.isLoading) {
              return const CircularProgressIndicator().wrapCenter();
            }
            var data = state.apiResult.body;
            if (data == null) {
              return Text(state.apiResult.msg).wrapCenter();
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (context, index) =>
                  ArtistItemWidget(artist: data[index]),
              itemCount: data.length,
            );
          },
        ),
      ),
    );
  }
}