part of 'album_cubit.dart';

class AlbumState extends AbstractState<AlbumResponse> {
  const AlbumState({
    FormzSubmissionStatus? apiStatus,
    String? msg,
    AlbumResponse? data,
  }) : super(
          data: data,
          msg: msg,
          apiStatus: apiStatus ?? FormzSubmissionStatus.initial,
        );

  AlbumState copyWith({
    FormzSubmissionStatus? apiStatus,
    String? msg,
    AlbumResponse? data,
  }) {
    return AlbumState(
      apiStatus: apiStatus ?? this.apiStatus,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }
}
