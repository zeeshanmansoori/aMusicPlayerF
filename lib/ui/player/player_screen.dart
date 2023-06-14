import 'package:a_music_player_flutter/ui/player/widgets/player_controller_widget.dart';
import 'package:a_music_player_flutter/ui/player/widgets/player_progress_widget.dart';
import 'package:a_music_player_flutter/ui/player/widgets/player_thumbnail_widget.dart';
import 'package:a_music_player_flutter/utils/marquee_text.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  final String text = "Long string that has more than one line."
      " this is long text once and once again";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                ),
              )
            ],
          ).padding(bottom: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PlayerThumbnailWidget(),
            ],
          ).expanded(flex: 2),
          MarqueeWidget(
              child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )).paddingWithSymmetry(
            horizontal: 20,
            vertical: 40,
          ),
          const PlayerProgressWidget().paddingWithSymmetry(
            horizontal: 20,
            vertical: 10,
          ),
          const PlayerControllersWidget().padding(top: 30),
          Spacer(),
        ],
      ),
    );
  }

  static showPlayerBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) => const PlayerScreen(),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }
}
