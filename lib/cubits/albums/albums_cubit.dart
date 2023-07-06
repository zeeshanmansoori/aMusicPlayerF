import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:shared_repo/models/api_result.dart';
import 'package:spotify_repo/spotify_repo.dart';

part 'albums_state.dart';

class AlbumsCubit extends AbstractCubit<AlbumsState> {
  final SpotifyRepo _repo;

  AlbumsCubit(this._repo) : super(const AlbumsState()) {
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

}
