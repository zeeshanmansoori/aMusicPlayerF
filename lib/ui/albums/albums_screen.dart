import 'package:a_music_player_flutter/cubits/home/home_cubit.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsScreen extends StatelessWidget {

  static const routeName = "/AlbumsScreen";

  const AlbumsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(context.read<ApiClient>()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Text("AlbumsScreen").wrapCenter();
        },
      ),
    );
  }
}
