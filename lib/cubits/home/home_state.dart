part of 'home_cubit.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus apiStatus;
  final AlbumsResponse? data;
  final String? message;
  final Map<String, int> palette;

  const HomeState({
    this.apiStatus = FormzSubmissionStatus.initial,
    this.data,
    this.message,
    this.palette = const {},
  });

  @override
  List<Object?> get props => [
        apiStatus,
        data,
        palette,
        message,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? apiStatus,
    AlbumsResponse? data,
    String? message,
    Map<String, int>? palette,
  }) {
    return HomeState(
      apiStatus: apiStatus ?? this.apiStatus,
      data: data ?? this.data,
      message: message ?? this.message,
      palette: palette ?? this.palette,
    );
  }
}
