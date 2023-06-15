part of 'home_cubit.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus apiStatus;
  final AlbumsResponse? data;
  final String? message;

  const HomeState({
    this.apiStatus = FormzSubmissionStatus.initial,
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        apiStatus,
        data,
        message,
      ];

  HomeState copyWith({
    FormzSubmissionStatus? apiStatus,
    AlbumsResponse? data,
    String? message,
  }) {
    return HomeState(
      apiStatus: apiStatus ?? this.apiStatus,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
