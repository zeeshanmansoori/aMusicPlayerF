import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_repo/model_exports.dart';

class ApiClient {
  final String baseUrl = "api.spotify.com";
  static const String accessToken =
      "BQC4BA1OCaHOQNT_HlFAzcUf-7ifHtmdDhCgVCyB1i9PPKGKcAfqHSYCb4HTUYFoikGtXhIEIFab-bCTw6SLzOrX1f55SS9_9RyCsF1Ogrpse2cm5QA";

  final header = {"Authorization": "Bearer $accessToken"};

  void getAccessToken() async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '__Host-device_id=AQCEiu0w1lw_1HwredFklPB5EkAn6hTcOm_al3TpfDlEdLOv9GgDzPAgYiacrYRVJzj4tftgHL1qi_2Pi2za6AGk1-gbwb2isWs'
    };
    var request = http.Request(
        'POST', Uri.parse('https://accounts.spotify.com/api/token'));
    request.bodyFields = {
      'grant_type': 'client_credentials',
      'client_id': '690a76366ff84bc3b279ec8ea11660a1',
      'client_secret': '1cce6a2e492041769d7e31175011731d'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("token : ");
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<RequestStatus<List<dynamic>>> getNewAlbums() async {
    var uri = Uri.https(
      baseUrl,
      "/v1/recommendations/available-genre-seeds",
    );
    return runWithCatch(
          () => http.get(uri, headers: header),
          (decodedBody) => List.of(decodedBody["genres"] as Iterable<dynamic>,),
    );
  }

  Future<RequestStatus<List<dynamic>>> getGenres() async {
    var uri = Uri.https(
      baseUrl,
      "/v1/recommendations/available-genre-seeds",
    );
    return runWithCatch(
      () => http.get(uri, headers: header),
      (decodedBody) => List.of(decodedBody["genres"] as Iterable<dynamic>,),
    );
  }

  Future<RequestStatus<T>> runWithCatch<T>(
    Future<http.Response> Function() getResponse,
    T Function(dynamic decodedBody) getDataFromBody,
  ) async {
    try {
      final response = await getResponse.call();
      if (response.statusCode == 200) {
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
