import 'dart:async';

import 'package:a_music_player_flutter/utils/custom_colors.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  Timer? _cTimer;

  PlayerCubit() : super(const PlayerState());

  void togglePlayerState() {
    emit(state.copyWith(isPlaying: !state.isPlaying));
    if (state.isPlaying) {
      _startTimer();
    }
  }

  void _startTimer() {
    _cTimer?.cancel();
    emit(state.copyWith(progress: 0));
    _cTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(
        state.copyWith(
          progress: state.progress + .1,
        ),
      );
    });
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
}
