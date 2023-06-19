import 'package:a_music_player_flutter/utils/base/cubit/abstract_cubit.dart';
import 'package:a_music_player_flutter/utils/extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:formz/formz.dart';
import 'package:shared_repo/model_exports.dart';

part 'album_state.dart';

class AlbumCubit extends AbstractCubit<AlbumState> {
  final ApiClient _client;
  final String albumId;

  AlbumCubit(
    this._client,
    this.albumId,
  ) : super(const AlbumState()) {
    _getAlbum();
  }

  void _getAlbum() async {
    emit(state.copyWith(apiStatus: FormzSubmissionStatus.inProgress));
    var result = await _client.getAlbum(albumId);
    emit(state.copyWith(
      apiStatus: result.toApiStatus(),
      data: result.body,
      msg: result.toMessage(),
    ));
    if (result.status == RequestStatus.UN_AUTHORIZE) {
      _client.getAccessToken(_getAlbum);
    }
  }
}
