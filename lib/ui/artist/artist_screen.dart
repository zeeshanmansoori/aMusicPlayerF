import 'dart:ui';

import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
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
      appBar: AppBar(toolbarHeight: 0,),
      body: Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: albumId.images.first.url,
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // title: Text("My Awesome App"),
                // floating: true,
                // elevation: 10.0,
                // backgroundColor: Colors.grey,
                // toolbarHeight: 150,
                // centerTitle: true,
                expandedHeight: 300,

                flexibleSpace: Column(
                  children: [
                    Text("sfsdgds"),
                  ],
                ),
                forceMaterialTransparency: true,
              ),
              SliverList.builder(
                itemBuilder: (context, index) => Container(
                  child: Text("index $index").paddingAll(20),
                  color: Colors.redAccent,
                ),
                itemCount: 100,
              )
            ],
          )
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CachedNetworkImage(
            fit: BoxFit.fitWidth,
            imageUrl: albumId.images.first.url,
          ),
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    expandedHeight: 300.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      // centerTitle: true,
                      background: Container(
                        height: 300,
                        width: 300,
                      ),
                      title: Text(
                        albumId.name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    forceElevated: innerBoxIsScrolled,
                    forceMaterialTransparency: true,
                  ),
                )
              ];
            },
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColors.colorPrimary,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ).expanded(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

