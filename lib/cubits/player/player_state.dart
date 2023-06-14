part of 'player_cubit.dart';

class PlayerState extends Equatable {
  final bool isPlaying;
  final double progress;

  @override
  List<Object?> get props => [
        isPlaying,
        progress,
      ];

  const PlayerState({
    this.isPlaying = false,
    this.progress = 0,
  });

  PlayerState copyWith({
    bool? isPlaying,
    double? progress
  }) {
    return PlayerState(
      isPlaying: isPlaying ?? this.isPlaying,
      progress: progress ?? this.progress,
    );
  }
}
