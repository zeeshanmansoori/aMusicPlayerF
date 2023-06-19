part of 'abstract_cubit.dart';

abstract class AbstractState<T> extends Equatable {
  final FormzSubmissionStatus apiStatus;
  final String? msg;
  final T? data;

  const AbstractState({
    required this.data,
    required this.msg,
    required this.apiStatus,
  });

  @override
  List<Object?> get props => [
        apiStatus,
        msg,
        data,
      ];

}
