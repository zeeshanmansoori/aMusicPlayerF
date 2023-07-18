import 'dart:async';

import 'package:a_music_player_flutter/spotify_service.dart';
import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spotify_sdk/models/track.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  final SpotifyService _service = SpotifyService();
  Timer? _cTimer;

  PlayerCubit() : super(const PlayerState()) {
    _initService();
  }

  void togglePlayerState() {
    _service.togglePlayingState(state.isPlaying);
  }

  void updateColor(String albumId, int color) {
    Map<String, int> map = Map.from(state.palette);
    map[albumId] = color;
    emit(state.copyWith(
      primaryColor: color,
      palette: map,
    ));
  }

  bool hasColorGenerated(String albumId) {
    return state.palette[albumId] != null;
  }

  int getAlbumColorAndSetPrimaryColor(String id) {
    var albumColor = state.palette[id] ?? state.primaryColor;
    emit(state.copyWith(primaryColor: albumColor));
    return albumColor;
  }

  int getPrimaryColor() => state.primaryColor;

  void _initService() async {
    //await _service.getToken();
    var connectResult = await _service.connectToRemote();
    var getStream = _service.getPlayerStatusAsStream();
    emit(state.copyWith(msg: connectResult ? null : "Something went wrong"));
    getStream.listen((event) {
      print("zeeshan  track uri  ${event.track?.uri}");
      var oldState = state;
      emit(state.copyWith(
        isPlaying: !event.isPaused,
        track: event.track,
        playbackPosition: event.playbackPosition,
      ));
      if (oldState.isPlaying != state.isPlaying ||
          oldState.track != state.track) {
        if (state.isPlaying) {
          _startTimer();
        } else {
          _cTimer?.cancel();
        }
      }
    });
  }

  void _startTimer() {
    _cTimer?.cancel();
    _cTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(
        state.copyWith(
          playbackPosition: state.playbackPosition + 1000,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _cTimer?.cancel();
    _cTimer = null;
    return super.close();
  }

  void playNext() {
    _service.playNext();
  }
  void playPrevious() {
    _service.playPrevious();
  }

  void playSong(String uri) {
    _service.playSpotifyUri(uri);
  }
}
