import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_repo/models/Items.dart';

class AlbumItemWidget extends StatelessWidget {
  const AlbumItemWidget({
    super.key,
    required this.item,
    // required this.onColorGenerated,
    required this.onClick,
    // required this.isColorFetched,
  });


  final AlbumItems item;
  // final void  Function(String id, int color) onColorGenerated;
  // final bool  Function(String id) isColorFetched;
  final void Function(AlbumItems item) onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: CachedNetworkImage(imageUrl: item.images.first.url),
    ).asButton(
      onClick: () {
        onClick.call(item);
      },
    );
  }
}
