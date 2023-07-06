import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:shared_repo/models/api_result.dart';
import 'package:spotify_repo/spotify_repo.dart';

part 'home_state.dart';

class HomeCubit extends AbstractCubit<HomeState> {
  final SpotifyRepo _repo;

  HomeCubit(this._repo) : super(const HomeState()) {
  }

}
