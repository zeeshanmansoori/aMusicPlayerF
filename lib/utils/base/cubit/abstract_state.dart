part of 'abstract_cubit.dart';

abstract class AbstractState<T> extends Equatable {
  final ApiResult<T?> apiResult;
  final String? msg;

  const AbstractState({
    this.msg,
    this.apiResult = ApiResult.initial,
  });

  /// override this when you have extra fields in your state.
  @override
  List<Object?> get props => [
        apiResult,
        msg,
      ];

}
