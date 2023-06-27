import 'package:a_music_player_flutter/cubits/home/home_cubit.dart';
import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/home/widgets/album_item_widget.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shared_repo/models/Items.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(context.read<ApiClient>()),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = context.read<HomeCubit>();
            if (state.apiStatus.isInProgress) {
              return const CircularProgressIndicator().wrapCenter();
            }
            var data = state.data;
            if (data == null) return Text(state.message ?? "").wrapCenter();
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index)=> AlbumItemWidget(
                item: data.items[index],
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
              ),
              itemCount: data.items.length,
            );
          },
        ),
      ),
    );
  }
}
