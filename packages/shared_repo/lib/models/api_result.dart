class ApiResult<T> {
  static const FAILURE = 0;
  static const SUCCESS = 1;
  static const LOADING = 2;
  static const UN_AUTHORIZE = 3;
  static const INITIAL = 3;

  final int status;
  final String msg;
  final T? body;

  bool get isLoading => status == LOADING;
  bool get isSuccess => status == SUCCESS;
  bool get isUnAuthorized => status == UN_AUTHORIZE;

  const ApiResult(
    this.status,
    this.msg,
    this.body,
  );

  static const initial = ApiResult(
    INITIAL,
    "",
    null,
  );
  static final somethingWentWrong = ApiResult.failure("Something went wrong");
  static final checkInternetConnection = ApiResult.failure("Check your internet connection");

  factory ApiResult.loading({
    String? msg,
    T? body,
  }) =>
      ApiResult(
        LOADING,
        msg ?? "",
        body,
      );

  factory ApiResult.success({
    String? msg,
    T? body,
  }) =>
      ApiResult(
        SUCCESS,
        msg ?? "",
        body,
      );

  factory ApiResult.failure(
    String msg, {
    T? body,
  }) =>
      ApiResult(
        FAILURE,
        msg,
        body,
      );



  @override
  String toString() {
    return 'ApiResult{status: $status, msg: $msg, body: $body}';
  }
}
