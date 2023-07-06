import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Home Screen").wrapCenter();
  }
}
