import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

class PlayerProgressWidget extends StatelessWidget {
  const PlayerProgressWidget({super.key});

  final String startTime = "00:00";
  final String endTime = "05:00";
  final double progress = .3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(startTime),
            Text(endTime),
          ],
        ).padding(top: 10),
      ],
    );
  }
}
