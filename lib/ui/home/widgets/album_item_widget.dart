import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shared_repo/models/Items.dart';

class AlbumItemWidget extends StatelessWidget {
  const AlbumItemWidget({
    super.key,
    required this.item,
  });

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Image.network(item.images.first.url),
      // child: Column(
      //   children: [
      //     Image.network(item.images.first.url).expanded()
      //   ],
      // ),
    ).asButton(
      onClick: () => Navigator.pushNamed(
        context,
        AlbumScreen.routeName,
        arguments: item.id,
      ),
    );
  }
}
