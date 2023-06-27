part of 'artist_cubit.dart';

class ArtistState extends Equatable {
  final int? color;


  @override
  List<Object?> get props => [color];

  const ArtistState({
    this.color,
  });

  ArtistState copyWith({
    int? color,
  }) {
    return ArtistState(
      color: color ?? this.color,
    );
  }
}
