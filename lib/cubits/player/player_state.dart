part of 'player_cubit.dart';

class PlayerState extends Equatable {
  final bool isPlaying;
  final int primaryColorInt;
  Color  get primaryColor =>Color(primaryColorInt);
  final Map<String, int> palette;
  final String? msg;
  final Track? track;
  final int playbackPosition;
  double get progress => playbackPosition / (track?.duration ?? 1);

  @override
  List<Object?> get props => [
        isPlaying,
        primaryColorInt,
        palette,
        msg,
        track,
        playbackPosition,
      ];

  const PlayerState({
    this.msg,
    this.isPlaying = false,
    this.primaryColorInt = CustomColors.colorPrimaryInt,
    this.palette = const {},
    this.track,
    this.playbackPosition = 0,
  });

  PlayerState copyWith({
    bool? isPlaying,
    double? progress,
    int? primaryColor,
    Map<String, int>? palette,
    String? msg,
    Track? track,
    int? playbackPosition,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      primaryColorInt: primaryColor ?? this.primaryColorInt,
      palette: palette ?? this.palette,
      msg: msg ?? this.msg,
      track: track ?? this.track,
      playbackPosition: playbackPosition ?? this.playbackPosition,
    );
  }
}
