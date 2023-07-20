import 'package:a_music_player_flutter/cubits/home/home_cubit.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_repo/spotify_repo.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<SpotifyRepo>()),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (p, c) => p.apiResult != c.apiResult,
        builder: (context, state) {
          if (state.apiResult.isLoading) {
            return const CircularProgressIndicator().wrapCenter();
          }
          if (!state.apiResult.isUnAuthorized) {
            return const Text("UnAuthorized").wrapCenter();
          }

          if (state.apiResult.isInitial) {
            return Container(
              // color: Colors.red,
              child: const Text("HOME").wrapCenter(),
            );
          }

          if (!state.apiResult.isSuccess) {
            return const Text("Something Went Wrong").wrapCenter();
          }
          var data = state.apiResult.body;
          if (data == null) {
            return const Text("Empty Response").wrapCenter();
          }
          return Container(
            color: Colors.redAccent,
            child: Text("HOME").wrapCenter(),
          );
        },
      ),
    );
  }
}
