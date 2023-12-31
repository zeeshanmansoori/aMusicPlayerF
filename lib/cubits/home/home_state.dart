part of 'home_cubit.dart';

class HomeState extends AbstractState<AlbumsResponse> {


  const HomeState({
    ApiResult<AlbumsResponse?>? apiResult,
    String? msg,
  }) : super(
          apiResult: apiResult ?? ApiResult.initial,
          msg: msg,
        );

  HomeState copyWith({
    ApiResult<AlbumsResponse?>? apiResult,
    String? msg,
  }) {
    return HomeState(
      apiResult: apiResult ?? this.apiResult,
      msg: msg ?? this.msg,

    );
  }
}
