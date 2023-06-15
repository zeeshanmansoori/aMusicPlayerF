import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_repo/model_exports.dart';

class ApiClient {
  final String baseUrl = "api.spotify.com";
  static const String accessToken =
      "BQAT2n5k7NYHPUdHeyaKMaxMkgpPHBNcf-eY1OViervMdMx6wWx4gum-kmcIvBCedo5AW8W65O-zfBNr8RcB0-O62DRBglp56J8a1zZ2uXLapPL9oS0";

  final header = {"Authorization": "Bearer $accessToken"};

  Future<RequestStatus<List<String>>> getGenres() async {
    var uri = Uri.https(
      baseUrl,
      "/v1/recommendations/available-genre-seeds",
    );
    return runWithCatch(
      () => http.get(uri, headers: header),
      (decodedBody) => decodedBody as List<String>,
    );
  }

  Future<RequestStatus<T>> runWithCatch<T>(
    Future<http.Response> Function() getResponse,
    T Function(dynamic decodedBody) getDataFromBody,
  ) async {
    try {
      final response = await getResponse.call();
      if (response.statusCode == RequestStatus.SUCCESS) {
        var decodedData = getDataFromBody.call(jsonDecode(response.body));

        return RequestStatus(
          RequestStatus.SUCCESS,
          "",
          decodedData,
        );
      }
      return _checkErrorCode(response);
    } catch (e, stackTrace) {
      return _commonCatchBlock(e, stackTrace);
    }
  }

  RequestStatus<T> _checkErrorCode<T>(http.Response response) {
    if (response.statusCode == 401) {
      print("ApiClient _checkErrorCode ${response.request}");
      return RequestStatus<T>(
        RequestStatus.UN_AUTHORIZE,
        "session expired!",
        null,
      );
    }

    if (500 > response.statusCode && response.statusCode >= 400) {
      String msg = jsonDecode(response.body)['msg'] ??
          jsonDecode(response.body)['message'] ??
          jsonDecode(response.body)['status'] ??
          jsonDecode(response.body)['detail'] ??
          jsonDecode(response.body)['error_description'] ??
          jsonDecode(response.body)['error'] ??
          jsonDecode(response.body)['error_message'] ??
          'Something went wrong';
      return RequestStatus<T>(RequestStatus.FAILURE, msg, null);
    } else {
      ////print("Status Code: ${response.statusCode}");
      print("ApiClient Reason phase: ${response.reasonPhrase}");
      throw Exception("Response code is ${response.statusCode}");
    }
  }

  /// Used inside every catch block of api call
  /// It returns Failed [RequestStatus] with appropriate message
  RequestStatus<T> _commonCatchBlock<T>(e, StackTrace stackTrace) {
    var completer = Completer();
    completer.completeError(e, stackTrace);
    print("ApiClient  _commonCatchBlock $stackTrace");
    if (e is TimeoutException || e is SocketException) {
      return RequestStatus<T>(
        RequestStatus.FAILURE,
        'Check internet connection',
        null,
      );
    }
    return RequestStatus<T>(
      RequestStatus.FAILURE,
      'Something went wrong',
      null,
    );
  }
}
