import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/ui/player/widgets/player_controller_widget.dart';
import 'package:a_music_player_flutter/ui/player/widgets/player_progress_widget.dart';
import 'package:a_music_player_flutter/ui/player/widgets/player_thumbnail_widget.dart';
import 'package:a_music_player_flutter/utils/marquee_text.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PlayerCubit>();
    return Container(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.chevron_down,
                ),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          BlocBuilder<PlayerCubit, PlayerState>(
            buildWhen: (p, c) => p.track!.album.uri != c.track!.album.uri,
            builder: (context, state) {
              return Column(
                children: [
                  PlayerThumbnailStaticWidget(track: state.track).padding(top: 10),
                  MarqueeWidget(
                    child: Text(
                      state.track?.name ?? "",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ).paddingWithSymmetry(
                    horizontal: 20,
                    vertical: 40,
                  ),
                ],
              );
            },
          ),
          const PlayerProgressWidget().paddingWithSymmetry(
            horizontal: 20,
            vertical: 10,
          ),
          const PlayerControllersWidget().padding(top: 30),
          const Spacer(),
        ],
      ),
    );
  }

  static showPlayerBottomSheet(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<PlayerCubit>(),
        child: const PlayerScreen(),
      ),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }
}
