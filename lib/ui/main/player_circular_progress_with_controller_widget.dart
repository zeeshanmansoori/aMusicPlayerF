import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerCircularProgressWithControllerWidget extends StatelessWidget {
  const PlayerCircularProgressWithControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) {
        var cubit = context.read<PlayerCubit>();
        print("zeeshan progress ${state.progress}");
        return Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: state.progress,
            ),
            IconButton(
              alignment: Alignment.center,
              onPressed: cubit.togglePlayerState,
              // iconSize: 10,
              icon: Icon(
                !state.isPlaying ? Icons.play_arrow : Icons.pause,
              ),
            )
          ],
        );
      },
    );
  }
}
