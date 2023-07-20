import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerControllersWidget extends StatelessWidget {
  const PlayerControllersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).colorScheme.primary;
    var cubit = context.read<PlayerCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: cubit.playPrevious,
          icon: const Icon(CupertinoIcons.repeat),
        ),
        IconButton(
          onPressed: cubit.playPrevious,
          icon: const Icon(CupertinoIcons.),
        ),
        MaterialButton(
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
        ),
        IconButton(
          onPressed: cubit.playNext,
          icon: const Icon(Icons.skip_next),
        ),
        IconButton(
          onPressed: cubit.playNext,
          icon: const Icon(CupertinoIcons.shuffle),
        ),
      ],
    );
  }
}
