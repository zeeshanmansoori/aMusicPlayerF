import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/models/nav_item.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/artist/artist_screen.dart';
import 'package:a_music_player_flutter/ui/home/home_screen.dart';
import 'package:a_music_player_flutter/ui/main/player_static_bar_widget.dart';
import 'package:a_music_player_flutter/ui/playlist/playlist_screen.dart';
import 'package:a_music_player_flutter/utils/constants.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.blue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const MainScreen(),
      // home: MyPage(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const _navItems = [
    NavItem(
      title: "Home",
      icon: CupertinoIcons.home,
      screen: HomeScreen(),
    ),
    NavItem(
      title: "Album",
      icon: CupertinoIcons.music_albums,
      screen: AlbumScreen(),
    ),
    NavItem(
      title: "Artist",
      icon: Icons.music_note,
      screen: ArtistScreen(),
    ),
    NavItem(
      title: "Playlist",
      icon: CupertinoIcons.music_note_list,
      screen: PlaylistScreen(),
    ),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  var selectedIndex = 0;
  final ScrollController _controller = ScrollController();
  final double _bottomNavBarHeight = 60;

  // late final MyDraggableScrollListener _scrollController;

  @override
  void initState() {
    // _scrollController = MyDraggableScrollListener.initialise(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return PlayerCubit();
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          height: Constants.bottomNavHeight,
          selectedIndex: selectedIndex,
          destinations: MainScreen._navItems
              .map(
                (e) => NavigationDestination(
                  icon: Icon(e.icon),
                  label: e.title,
                ),
              )
              .toList(),
          onDestinationSelected: (index) => setState(() {
            selectedIndex = index;
          }),
        ),
        body: Column(
          children: [
            MainScreen._navItems
                .map((e) => e.screen)
                .elementAt(selectedIndex)
                .expanded(),
            const PlayerStaticBarWidget()
          ],
        ),
      ),
    );
  }

}

