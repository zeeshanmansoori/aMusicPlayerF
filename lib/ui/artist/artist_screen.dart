import 'dart:ui';

import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_repo/model_exports.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  static const String routeName = "/artistScreen";

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  late Color primaryColor;
  late ArtistResponse albumId;

  @override
  void didChangeDependencies() {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    albumId = args["artist"] as ArtistResponse;
    primaryColor = args["color"] == null
        ? CustomColors.colorPrimary
        : Color(args["color"] as int);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("zeeshan artists ${albumId}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  // centerTitle: true,
                  background: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          albumId.images.first.url,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    albumId.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            )
          ];
        },
        body: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              color: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }
}
