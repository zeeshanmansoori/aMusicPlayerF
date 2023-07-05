part of 'home_cubit.dart';

class HomeState extends AbstractState<AlbumsResponse> {
  final Map<String, int> palette;

  @override
  List<Object?> get props => [...super.props,palette];

  const HomeState({
    ApiResult<AlbumsResponse?>? apiResult,
    String? msg,
    this.palette = const {},
  }) : super(
          apiResult: apiResult ?? ApiResult.initial,
          msg: msg,
        );

  HomeState copyWith({
    ApiResult<AlbumsResponse?>? apiResult,
    Map<String, int>? palette,
    String? msg,
  }) {
    return HomeState(
      apiResult: apiResult ?? this.apiResult,
      msg: msg ?? this.msg,
      palette: palette ?? this.palette,
    );
  }
}
