import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/models/nav_item.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/albums/albums_screen.dart';
import 'package:a_music_player_flutter/ui/artist/artist_screen.dart';
import 'package:a_music_player_flutter/ui/artists/artists_screen.dart';
import 'package:a_music_player_flutter/ui/home/home_screen.dart';
import 'package:a_music_player_flutter/ui/main/player_static_bar_widget.dart';
import 'package:a_music_player_flutter/ui/playlist/playlist_screen.dart';
import 'package:a_music_player_flutter/utils/constants.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_repo/spotify_repo.dart';

void main() {
  var _client = ApiClient.getInstance(
    // () async {
    //   var shared = await SharedPreferences.getInstance();
    //   return shared.getString(Constants.accessToken);
    // },
    // (token) async {
    //   var shared = await SharedPreferences.getInstance();
    //   shared.setString(Constants.accessToken, token);
    // },
  );
  var repo = SpotifyRepo(_client);
  runApp(MyApp(repo));
}

class MyApp extends StatelessWidget {
  const MyApp(this.spotifyRepo, {super.key});

  // final ApiClient client;
  final SpotifyRepo spotifyRepo;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (c) => spotifyRepo),
      ],
      child: BlocProvider(
        create: (BuildContext context) {
          return PlayerCubit();
        },
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
          // Use dark or light theme based on system setting.
          themeMode: ThemeMode.system,
          home: const MainScreen(),
          routes: {
            AlbumScreen.routeName: (_) => const AlbumScreen(),
            ArtistScreen.routeName: (_) => const ArtistScreen(),
          },
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const navItems = [
    NavItem(
      title: "Home",
      icon: CupertinoIcons.music_house,
      screen: HomeScreen(),
    ),
    NavItem(
      title: "Album",
      icon: CupertinoIcons.music_albums,
      screen: AlbumsScreen(),
    ),
    NavItem(
      title: "Artist",
      icon: Icons.music_note_outlined,
      screen: ArtistsScreen(),
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
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.zero,
      //   child: AppBar(
      //     // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      //       // statusBarColor: Colors.white,
      //     // ),
      //   ),
      // ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PlayerStaticBarWidget(),
          BlocBuilder<PlayerCubit, PlayerState>(
            buildWhen: (p, c) => p.primaryColor != c.primaryColor,
            builder: (context, state) {
              return NavigationBar(
                height: Constants.bottomNavHeight,
                selectedIndex: _selectedIndex,
                destinations: MainScreen.navItems
                    .map(
                      (e) => NavigationDestination(
                        icon: Icon(e.icon),
                        label: e.title,
                      ),
                    )
                    .toList(),
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                indicatorColor: Color(state.primaryColor),
              );
            },
          ),
        ],
      ),
      body: MainScreen.navItems[_selectedIndex].screen,
    );
  }
}
