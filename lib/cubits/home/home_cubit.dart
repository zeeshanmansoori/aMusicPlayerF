import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:shared_repo/models/api_result.dart';
import 'package:spotify_repo/spotify_repo.dart';

part 'home_state.dart';

class HomeCubit extends AbstractCubit<HomeState> {
  final SpotifyRepo _repo;

  HomeCubit(this._repo) : super(const HomeState()) {
    _getAlbums();
  }

  void _getAlbums() async {
    emit(state.copyWith(apiResult: ApiResult.loading()));
    var result = await _repo.getNewAlbums();
    emit(state.copyWith(
      apiResult: result,
    ));
    if (result.isUnAuthorized) {
      _repo.getAccessToken(_getAlbums);
    }
  }

  void onColorGenerated(String id,int color) {
    Map<String, int> map = Map.from(state.palette);
    map[id] = color;
    emit(state.copyWith(palette: map));
  }

  int? getGeneratedColor(String id) {
    return state.palette[id];
  }

  bool isColorFetched(String id) {
    return state.palette.containsKey(id);
  }
}
