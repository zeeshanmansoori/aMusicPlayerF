import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:shared_repo/model_exports.dart';
import 'package:shared_repo/models/api_result.dart';
import 'package:spotify_repo/spotify_repo.dart';

part 'album_state.dart';

class AlbumCubit extends AbstractCubit<AlbumState> {
  final SpotifyRepo _repo;
  final String albumId;

  AlbumCubit(
    this._repo,
    this.albumId,
  ) : super(const AlbumState()) {
    _getAlbum();
  }

  void _getAlbum() async {
    emit(state.copyWith(apiResult: ApiResult.loading()));
    var result = await _repo.getAlbum(albumId);
    emit(state.copyWith(
      apiResult: result,
    ));
    if (result.isUnAuthorized) {
      _repo.getAccessToken(_getAlbum);
    }
  }
}
