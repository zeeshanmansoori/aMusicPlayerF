import 'package:a_music_player_flutter/custom_widgets/color_palette_image.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_repo/models/Items.dart';

class AlbumItemWidget extends StatelessWidget {
  const AlbumItemWidget({
    super.key,
    required this.item,
    required this.onColorGenerated,
    required this.onClick,
    required this.isColorFetched,
  });


  final Items item;
  final void  Function(String id, int color) onColorGenerated;
  final bool  Function(String id) isColorFetched;
  final void Function(Items item) onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      //child: imageWidget,
      child: ColorPaletteImage(
        url: item.images.first.url,
        onColorGenerated: (color) {
          onColorGenerated.call(item.id, color);
        }, isColorFetched: () => isColorFetched.call(item.id),
      ),
    ).asButton(
      onClick: () {
        onClick.call(item);
      },
    );
  }
}
