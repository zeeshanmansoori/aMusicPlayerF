import 'package:a_music_player_flutter/cubits/artists/artist_cubit.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtistScreen extends StatelessWidget {
  static const String routeName = "/ArtistScreen";

  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArtistCubit(),
      child: BlocBuilder<ArtistCubit, ArtistState>(
        builder: (context, state) {
          return Column(
            children: [
              Center(child: Text("ArtistScreen")).expanded(),
              Container(
                color: state.color == null ? null : Color(state.color!),
                child: Row(children: [

                ],),
              ).expanded()
            ],
          );
        },
      ),
    );
  }
}
