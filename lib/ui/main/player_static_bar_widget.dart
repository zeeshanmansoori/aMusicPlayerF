import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/ui/main/player_circular_progress_with_controller_widget.dart';
import 'package:a_music_player_flutter/ui/player/player_screen.dart';
import 'package:a_music_player_flutter/utils/marquee_text.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerStaticBarWidget extends StatelessWidget {
  const PlayerStaticBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme
          .of(context)
          .colorScheme
          .surfaceVariant,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.chevron_up,
            ),
          ),
          BlocBuilder<PlayerCubit, PlayerState>(
            buildWhen: (p,c)=>p.track!=c.track,
            builder: (context, state) {
              return MarqueeWidget(
                child: Text(state.track?.name??""),
              );
            },
          )
              .padding(
            left: 10,
            right: 10,
          )
              .expanded(),
          const PlayerCircularProgressWithControllerWidget().padding(right: 10)
        ],
      ).asGestureButton(
        onClick: () => PlayerScreen.showPlayerBottomSheet(context),
      ),
    );
  }
}
