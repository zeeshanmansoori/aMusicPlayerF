import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerPlayPauseButton extends StatelessWidget {
  const PlayerPlayPauseButton({
    super.key,
    this.iconSize = 30,
  });

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      buildWhen: (p,c)=>p.primaryColor != c.primaryColor,
      builder: (context, state) {
        var cubit = context.read<PlayerCubit>();
        var primaryColor = state.primaryColor;
        return MaterialButton(
          onPressed: cubit.togglePlayerState,
          shape: const CircleBorder(),
          color: primaryColor,
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<PlayerCubit, PlayerState>(
            buildWhen: (p, c) =>
            p.isPlaying != c.isPlaying ,
            builder: (context, state) {
              return Icon(
                !state.isPlaying ? CupertinoIcons.play_arrow : CupertinoIcons
                    .pause,
                size: iconSize,
                color: Colors.white,
              );
            },
          ),
        );
      },
    );
  }
}
