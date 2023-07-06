part of 'albums_cubit.dart';

class AlbumsState extends AbstractState<AlbumsResponse> {

  const AlbumsState({
    ApiResult<AlbumsResponse?>? apiResult,
    String? msg,

  }) : super(
          apiResult: apiResult ?? ApiResult.initial,
          msg: msg,
        );

  AlbumsState copyWith({
    ApiResult<AlbumsResponse?>? apiResult,
    String? msg,
  }) {
    return AlbumsState(
      apiResult: apiResult ?? this.apiResult,
      msg: msg ?? this.msg,
      // palette: palette ?? this.palette,
    );
  }
}
