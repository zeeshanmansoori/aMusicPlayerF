class RequestStatus<T> {

  static const FAILURE =0;
  static const SUCCESS =1;
  static const LOADING =2;
  static const UN_AUTHORIZE =3;

  final int status;
  final String msg;
  final T? body;

  RequestStatus(
    this.status,
    this.msg,
    this.body,
  );

  factory RequestStatus.success({
    String? msg,
    T? body,
  }) =>
      RequestStatus(
        SUCCESS,
        msg??"",
        body,
      );

  factory RequestStatus.failure(
      String msg,
      T? body,
      ) =>
      RequestStatus(
        FAILURE,
        msg,
        body,
      );

  static final SOMETHING_WENT_WRONG =
      RequestStatus(FAILURE, "Something went wrong", null);
  static final CHECK_INTERNET_CONNECTION =
      RequestStatus(FAILURE, "Check your internet connection", null);
}
