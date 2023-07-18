import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerPlayPauseButton extends StatelessWidget {
  const PlayerPlayPauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PlayerCubit>();
    var primaryColor = Theme.of(context).colorScheme.primary;

    return MaterialButton(
      onPressed: cubit.togglePlayerState,
      shape: const CircleBorder(),
      color: primaryColor,
      padding: const EdgeInsets.all(15),
      child: BlocBuilder<PlayerCubit, PlayerState>(
        buildWhen: (p, c) => p.isPlaying != c.isPlaying,
        builder: (context, state) {
          return Icon(
            !state.isPlaying ? Icons.play_arrow : Icons.pause,
            size: 30,
            color: Colors.white,
          );
        },
      ),
    );
  }
}
