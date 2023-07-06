import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:shared_repo/model_exports.dart';
import 'package:shared_repo/models/api_result.dart';
import 'package:spotify_repo/spotify_repo.dart';

part 'artist_state.dart';

class ArtistCubit extends AbstractCubit<ArtistState> {
  final SpotifyRepo _repo;

  ArtistCubit(this._repo) : super(const ArtistState()) {
    _getArtists();
  }

  void _getArtists() async {
    emit(state.copyWith(apiResult: ApiResult.loading()));
    var result = await _repo.getArtists();
    emit(state.copyWith(
      apiResult: result,
    ));
  }
}
