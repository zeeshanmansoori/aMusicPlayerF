import 'package:a_music_player_flutter/cubits/home/home_cubit.dart';
import 'package:a_music_player_flutter/ui/home/widgets/album_item_widget.dart';
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
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(context.read<ApiClient>()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.apiStatus.isInProgress) {
            return const CircularProgressIndicator().wrapCenter();
          }
          var data = state.data;
          if (data == null) return Text(state.message ?? "").wrapCenter();
          return Column(children: [
            Text("Album Screen")
          ],);
        },
      ),
    );
  }
}
