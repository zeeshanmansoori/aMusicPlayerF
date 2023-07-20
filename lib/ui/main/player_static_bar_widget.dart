import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/custom_widgets/circle_image.dart';
import 'package:a_music_player_flutter/custom_widgets/player_play_pause_button.dart';
import 'package:a_music_player_flutter/ui/main/player_circular_progress_widget.dart';
import 'package:a_music_player_flutter/ui/player/player_screen.dart';
import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:a_music_player_flutter/utils/marquee_text.dart';
import 'package:a_music_player_flutter/utils/utils.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerStaticBarWidget extends StatelessWidget {
  const PlayerStaticBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var startPadding = 30.0;
    var itemSize = 60.0;
    return CustomPaint(
      painter: CurvePainter(
        padding: startPadding,
        itemSize: itemSize,
        radius: 35,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          BlocBuilder<PlayerCubit, PlayerState>(
            buildWhen: (p, c) => p.track?.imageUri.raw != c.track?.imageUri.raw,
            builder: (context, state) {
              return PlayerCircularProgressWidget(
                size: itemSize,
                image:state.track?.imageUri
              );
            },
          ),

          BlocBuilder<PlayerCubit, PlayerState>(
            buildWhen: (p, c) => p.track != c.track,
            builder: (context, state) {
              return MarqueeWidget(
                child: Text(state.track?.name ?? "Songs title will come here....."),
              );
            },
          )
              .padding(
                left: 10,
                right: 10,
              )
              .expanded(),
          const PlayerPlayPauseButton(
            iconSize: 20,
          ),
        ],
      ).padding(left: startPadding,right: 5,top: 0,bottom: 50),
    ).asGestureButton(
      onClick: () => PlayerScreen.showPlayerBottomSheet(context),
    );
  }
}

class CurvePainter extends CustomPainter {
  final double itemSize;
  final double padding;
  final double radius;

  CurvePainter({
    required this.padding,
    required this.itemSize,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = CustomColors.playerBarColor;
    paint.style = PaintingStyle.fill; // Change this to fill
    var path = Path();
    var height = size.height;
    var width = size.width;
    path.moveTo(0, size.height);
    path.lineTo(0, height / 2);
    path.quadraticBezierTo(0, 0, radius, 0);
    var load = 0;
    path.lineTo(padding + load, 0);
    path.quadraticBezierTo(
      padding + (itemSize) / 2 +load , -itemSize *.4,
      padding + itemSize + load, 0,
    );
    path.lineTo(width - radius, 0);
    path.quadraticBezierTo(width, 0, width, height / 2);
    path.lineTo(width - 100, height);
    path.quadraticBezierTo(10, 10, width, height / 2);
    path.lineTo(width, height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}