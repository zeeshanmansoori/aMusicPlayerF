import 'package:a_music_player_flutter/ui/main/player_circular_progress_with_controller_widget.dart';
import 'package:a_music_player_flutter/ui/player/player_screen.dart';
import 'package:a_music_player_flutter/utils/marquee_text.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerStaticBarWidget extends StatelessWidget {
  const PlayerStaticBarWidget({super.key});

  final playerTitle =
      "if we have long song title then going to horizontally scroll here.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.chevron_up,
            ),
          ),
          MarqueeWidget(
            child: Text(playerTitle),
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
