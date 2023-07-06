part of 'player_cubit.dart';

class PlayerState extends Equatable {
  final bool isPlaying;
  final double progress;
  final int primaryColor;
  final Map<String, int> palette;

  @override
  List<Object?> get props => [
        isPlaying,
        progress,
        primaryColor,
        palette,
      ];

  const PlayerState({
    this.isPlaying = false,
    this.progress = 0,
    this.primaryColor = CustomColors.colorPrimaryInt,
    this.palette = const {},
  });

  PlayerState copyWith({
    bool? isPlaying,
    double? progress,
    int? primaryColor,
    Map<String, int>? palette,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      progress: progress ?? this.progress,
      primaryColor: primaryColor ?? this.primaryColor,
      palette: palette ?? this.palette,
    );
  }
}
