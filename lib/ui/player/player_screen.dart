import 'package:a_music_player_flutter/utils/marquee_text.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                ),
              ),
              MarqueeWidget(
                child: Text(
                    "if we have long song title then going to horizontally scroll here."),
              ).padding(left: 10, right: 10).expanded(),
              CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
