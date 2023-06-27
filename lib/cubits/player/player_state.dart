part of 'player_cubit.dart';

class PlayerState extends Equatable {
  final bool isPlaying;
  final double progress;
  final int primaryColor;

  @override
  List<Object?> get props => [
        isPlaying,
        progress,
        primaryColor,
      ];

  const PlayerState({
    this.isPlaying = false,
    this.progress = 0,
    this.primaryColor = CustomColors.colorPrimaryInt,
  });

  PlayerState copyWith({
    bool? isPlaying,
    double? progress,
    int? primaryColor,
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      progress: progress ?? this.progress,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }
}
