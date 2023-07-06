import 'package:a_music_player_flutter/ui/artist/widgets/artist_item_widget.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.redAccent, child: Text("HOME").wrapCenter());
  }
}
