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
import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:a_music_player_flutter/utils/widget_extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:defer_pointer/defer_pointer.dart';
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
        child:
        MaterialApp(
          title: 'Flutter Demo',
          theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.blue),
          // Use dark or light theme based on system setting.
          themeMode: ThemeMode.dark,
          home: BlocListener<PlayerCubit, PlayerState>(
            listenWhen: (p, c) => p.msg != c.msg,
            listener: (context, state) {
              if (state.msg != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.msg!),
                  ),
                );
              }
            },
            child: const MainScreen(),
          ),
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

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: MainScreen.navItems.length, vsync: this);
    tabController.addListener(_onTabChanged);
    super.initState();
  }

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
      bottomNavigationBar: DeferredPointerHandler(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -65,
              width: MediaQuery.of(context).size.width,
              child: const DeferPointer(child: PlayerStaticBarWidget(),),

            ),
            BlocBuilder<PlayerCubit, PlayerState>(
              buildWhen: (p, c) => p.primaryColorInt != c.primaryColorInt,
              builder: (context, state) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: CustomColors.tabColor,
                  ),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: state.primaryColor,
                        width: 3,
                      ),
                      insets: EdgeInsets.symmetric(horizontal: 25),
                    ),
                    tabs: MainScreen.navItems
                        .map(
                          (e) =>
                          Icon(e.icon).paddingWithSymmetry(vertical: 35),
                    )
                        .toList(),
                    labelColor: state.primaryColor,
                    unselectedLabelColor: CustomColors.tabIconColor,
                  ),
                );
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
                  indicatorColor: state.primaryColor,
                );
              },
            ),
          ],
        ),
      ),
      body: MainScreen.navItems[_selectedIndex].screen,
    );
  }

  void _onTabChanged() {
    var index = tabController.index;
    var previousIndex = tabController.previousIndex;
    if (index != previousIndex && _selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
