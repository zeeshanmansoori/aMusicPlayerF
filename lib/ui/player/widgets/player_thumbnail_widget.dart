import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

class PlayerThumbnailWidget extends StatefulWidget {
  const PlayerThumbnailWidget({super.key});

  @override
  State<PlayerThumbnailWidget> createState() => _PlayerThumbnailWidgetState();
}

class _PlayerThumbnailWidgetState extends State<PlayerThumbnailWidget> {
  late double sizePercent;
  late double _borderRadius;
  late double _blurRadius;
  late Color _color;

  _PlayerThumbnailWidgetState() {
    updateState(false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * sizePercent;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            // color: _color,
            borderRadius: BorderRadius.circular(_borderRadius),
            boxShadow: [
              BoxShadow(
                blurRadius: _blurRadius,
                blurStyle: BlurStyle.outer,
              )
            ]),
        child: Image.asset(
          Utils.getImagePath("music_1"),
          fit: BoxFit.cover,
        ),
          clipBehavior:Clip.antiAliasWithSaveLayer,
      ).asGestureButton(
        onLongPressDown: (d) {
          animateNUpdateState(true);
        },
        onLongPressUp: () {
          animateNUpdateState(false);
        },
      ),
    );
  }

  void animateNUpdateState(
    bool start,
  ) {
    setState(() {
      updateState(start);
    });
  }

  void updateState(bool start) {
    _color = start ? Colors.green : Colors.greenAccent;
    sizePercent = start ? 0.7 : 0.8;
    _borderRadius = start ? 14 : 12;
    _blurRadius = start ? 2 : 1.5;
  }
}
