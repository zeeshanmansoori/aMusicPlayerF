import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/utils/extensions.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerProgressWidget extends StatelessWidget {
  const PlayerProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      buildWhen: (p,c)=>p.playbackPosition!=c.playbackPosition,
      builder: (context, state) {
        return Column(
          children: [

            LinearProgressIndicator(
              value: state.progress,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state.playbackPosition.toTimeStampString()??""),
                Text(state.track?.duration.toTimeStampString()??""),

              ],
            ).padding(top: 10),
          ],
        );
      },
    );
  }
}
