import 'package:a_music_player_flutter/utils/extensions.dart';
import 'package:api_client_repo/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:shared_repo/models/albums_response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ApiClient _client;

  HomeCubit(this._client) : super(const HomeState()) {
    _getAlbums();
  }

  void _getAlbums() async {
    emit(state.copyWith(apiStatus: FormzSubmissionStatus.inProgress));
    var result = await _client.getNewAlbums();
    emit(state.copyWith(
      apiStatus: result.toApiStatus(),
      data: result.body,
      message: result.toMessage(),
    ));
  }
}
