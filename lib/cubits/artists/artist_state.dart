part of 'artist_cubit.dart';

class ArtistState extends AbstractState<List<ArtistResponse>> {
  final int? color;

  @override
  List<Object?> get props => [...super.props, color];

  const ArtistState({
    ApiResult<List<ArtistResponse>?>? apiResult,
    String? msg,
    this.color,
  }) : super(
          apiResult: apiResult ?? ApiResult.initial,
          msg: msg,
        );

  ArtistState copyWith({
    ApiResult<List<ArtistResponse>?>? apiResult,
    String? msg,
    int? color,
  }) {
    return ArtistState(
      color: color ?? this.color,
      apiResult: apiResult ?? this.apiResult,
      msg: msg ?? this.msg,
    );
  }
}
