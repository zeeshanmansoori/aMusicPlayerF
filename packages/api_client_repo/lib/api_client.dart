import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_repo/model_exports.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:shared_repo/models/api_result.dart';

class ApiClient {
  static ApiClient? _instance;
  static String accessToken =
      " BQDp31ydUV0_j7Sw7duGAqHXc02EGpGmku_Hn5HP0Ewdl-HhcFY7Ek0RlUCLHSir2d7wC2PShliCBlOEQmYNer5noYxk7OQrrFixjZn9YFpG3elHlLU";

  var useApi = true;

  static ApiClient getInstance() {
    _instance ??= ApiClient();
    // _setNewToken(getToken);
    // Future<String?> Function() getToken,
    // void Function(String token) setToken,
    return _instance!;
  }

  final String baseUrl = "api.spotify.com";

  Map<String, String> get header => {"Authorization": "Bearer $accessToken"};

  Future<String> getAccessToken([void Function()? onSuccess]) async {
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
      var tokenObj = await response.stream.bytesToString();
      var json = jsonDecode(tokenObj);
      var token = json["access_token"];
      accessToken = token;
      print("zeeshan token $accessToken");
      onSuccess?.call();
      return token;
    } else {
      return "";
    }
  }

  Future<ApiResult<AlbumsResponse>> getNewAlbums() async {
    if (!useApi) {
      return ApiResult.success(
        body: AlbumsResponse.dummy(),
      );
    }
    var uri = Uri.https(
      baseUrl,
      "/v1/browse/new-releases",
    );
    return runWithCatch(
      () => http.get(uri, headers: header),
      (decodedBody) => AlbumsResponse.fromJson(decodedBody["albums"]),
    );
  }

  Future<ApiResult<AlbumResponse>> getAlbum(String albumId) async {
    if (!useApi) {
      return ApiResult.success(body: AlbumResponse.dummy());
    }
    var uri = Uri.https(
      baseUrl,
      "/v1/albums/$albumId",
    );
    return runWithCatch(
      () => http.get(uri, headers: header),
      (decodedBody) => AlbumResponse.fromJson(decodedBody),
    );
  }

  Future<ApiResult<List<dynamic>>> getGenres() async {
    var uri = Uri.https(
      baseUrl,
      "/v1/recommendations/available-genre-seeds",
    );
    return runWithCatch(
      () => http.get(uri, headers: header),
      (decodedBody) => List.of(
        decodedBody["genres"] as Iterable<dynamic>,
      ),
    );
  }

  Future<ApiResult<List<ArtistResponse>>> getArtists(List<String> artistIds) {
    var uri = Uri.https(
      baseUrl,
      "/v1/artists",
    );
    return runWithCatch(
      () => http.get(uri, headers: header),
      (decodedBody) => (decodedBody["artists"] as Iterable)
          .map((e) => ArtistResponse.fromJson(e))
          .toList(),
    );
  }

  Future<ApiResult<T>> runWithCatch<T>(
    Future<http.Response> Function() getResponse,
    T Function(dynamic decodedBody) getDataFromBody,
  ) async {
    try {
      final response = await getResponse.call();
      if (response.statusCode == 200) {
        var decodedData = getDataFromBody.call(jsonDecode(response.body));

        return ApiResult(
          ApiResult.SUCCESS,
          "",
          decodedData,
        );
      }
      return _checkErrorCode(response);
    } catch (e, stackTrace) {
      return _commonCatchBlock(e, stackTrace);
    }
  }

  ApiResult<T> _checkErrorCode<T>(http.Response response) {
    log("ApiClient _checkErrorCode ${response.statusCode} ${response.body}");
    if (response.statusCode == 401) {
      return ApiResult<T>(
        ApiResult.UN_AUTHORIZE,
        "Session Expired!",
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
      return ApiResult<T>(ApiResult.FAILURE, msg, null);
    } else {
      ////print("Status Code: ${response.statusCode}");
      print("ApiClient Reason phase: ${response.reasonPhrase}");
      throw Exception("Response code is ${response.statusCode}");
    }
  }

  /// Used inside every catch block of api call
  /// It returns Failed [ApiResult] with appropriate message
  ApiResult<T> _commonCatchBlock<T>(e, StackTrace stackTrace) {
    var completer = Completer();
    completer.completeError(e, stackTrace);
    print("ApiClient  _commonCatchBlock $stackTrace");
    if (e is TimeoutException || e is SocketException) {
      return ApiResult<T>(
        ApiResult.FAILURE,
        'Check internet connection',
        null,
      );
    }
    return ApiResult<T>(
      ApiResult.FAILURE,
      'Something went wrong',
      null,
    );
  }

  // static void _setNewToken(Future<String?> Function() getToken) async{
  //   var oldToken  = await getToken.call();
  //   if(oldToken!=null){
  //     accessToken = oldToken;
  //   }
  // }
}
