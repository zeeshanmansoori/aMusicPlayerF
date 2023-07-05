part of 'album_cubit.dart';

class AlbumState extends AbstractState<AlbumResponse> {
  const AlbumState({
    ApiResult<AlbumResponse?>? apiResult,
    String? msg,
  }) : super(
          apiResult: apiResult ?? ApiResult.initial,
          msg: msg,
        );

  AlbumState copyWith({
    ApiResult<AlbumResponse?>? apiResult,
    String? msg,
  }) {
    return AlbumState(
      apiResult: apiResult ?? this.apiResult,
      msg: msg ?? this.msg,
    );
  }
}
