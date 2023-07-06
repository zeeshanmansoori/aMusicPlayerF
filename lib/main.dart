import 'package:a_music_player_flutter/cubits/player/player_cubit.dart';
import 'package:a_music_player_flutter/models/nav_item.dart';
import 'package:a_music_player_flutter/ui/album/album_screen.dart';
import 'package:a_music_player_flutter/ui/albums/albums_screen.dart';
import 'package:a_music_player_flutter/ui/artist/artist_screen.dart';
import 'package:a_music_player_flutter/ui/home/home_screen.dart';
import 'package:a_music_player_flutter/ui/main/player_static_bar_widget.dart';
import 'package:a_music_player_flutter/ui/playlist/playlist_screen.dart';
import 'package:a_music_player_flutter/utils/constants.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (c) => spotifyRepo),
        ],
        child: const MainScreen(),
        // child: Scaffold(
        //   body: AlbumScreen(),
        // ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const navItems = [
    NavItem(
      title: "Home",
      icon: CupertinoIcons.home,
      routeName: HomeScreen.routeName,
    ),
    NavItem(
      title: "Album",
      icon: CupertinoIcons.music_albums,
      routeName: AlbumsScreen.routeName,
    ),
    NavItem(
      title: "Artist",
      icon: Icons.music_note,
      routeName: ArtistScreen.routeName,
    ),
    NavItem(
      title: "Playlist",
      icon: CupertinoIcons.music_note_list,
      routeName: PlaylistScreen.routeName,
    ),
  ];

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  var _selectedIndex = 0;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return PlayerCubit();
      },
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.zero,
        //   child: AppBar(
        //     // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        //       // statusBarColor: Colors.white,
        //     // ),
        //   ),
        // ),
        bottomNavigationBar: BlocBuilder<PlayerCubit, PlayerState>(
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
                handleNestedNavigation(index);
                updateBottomNav(index);
              },
              indicatorColor: Color(state.primaryColor),
            );
          },
        ),
        body: WillPopScope(
          onWillPop: () {
            var state = _navigatorKey.currentState;
            var canPop = state?.canPop() ?? false;

            if (state == null || !canPop) return Future.value(true);
            var name = ModalRoute.of(state.context)!.settings.name;
            print("zeeshan navName ${name}");
            // state.popUntil((route) => route.isFirst);
             state.pop();

            updateBottomNav(0);
            return Future(() => false);
          },
          child: Column(
            children: [
              Navigator(
                key: _navigatorKey,
                initialRoute: MainScreen.navItems.first.routeName,
                onGenerateRoute: (settings) {
                  late Widget page;
                  switch (settings.name) {
                    case HomeScreen.routeName || "/":
                      page = const HomeScreen();
                      break;
                    case AlbumsScreen.routeName:
                      page = const AlbumsScreen();
                      break;
                    case ArtistScreen.routeName:
                      page = const ArtistScreen();
                      break;
                    case PlaylistScreen.routeName:
                      page = const PlaylistScreen();
                      break;
                    case AlbumScreen.routeName:
                      page = const AlbumScreen();
                      break;
                  }

                  return MaterialPageRoute<dynamic>(
                    builder: (context) {
                      return page;
                    },
                    settings: settings,
                  );
                },
              ).expanded(),
              const PlayerStaticBarWidget()
            ],
          ),
        ),
      ),
    );
  }

  void handleNestedNavigation(int index) {
    var navState = _navigatorKey.currentState;
    var oldRoute = ModalRoute.of(context)?.settings.name;
    var newRoute = MainScreen.navItems[index].routeName;
    if (navState == null || newRoute == oldRoute) return;
    navState.pushNamed(newRoute);
  }

  void updateBottomNav(int index) {
    setState(() {
      if (_selectedIndex != index) {
        _selectedIndex = index;
        (index);
      }
    });
  }
}
