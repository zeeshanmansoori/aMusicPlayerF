import 'package:api_client_repo/api_client.dart';
import 'package:shared_repo/models/album_response.dart';
import 'package:shared_repo/models/albums_response.dart';
import 'package:shared_repo/models/api_result.dart';
import 'package:shared_repo/models/artist_response.dart';

class SpotifyRepo {
  final ApiClient _client;
  final List<String> artistIds = [];
  ApiResult<AlbumsResponse>? cachedAlbums;

  SpotifyRepo(this._client);

  Future<ApiResult<AlbumsResponse>> getNewAlbums({bool useCache = true}) {
    if (useCache && cachedAlbums != null) {
      return Future.value(cachedAlbums);
    }
    var result = _client.getNewAlbums();
    result.then((value) {
      cachedAlbums = value;
      var ids = value.body?.items
              .expand((e) => e.artists)
              .map((artist) => artist.id) ??
          [];
      artistIds.clear();
      artistIds.addAll(ids.toSet());
    });
    return result;
  }

  Future<ApiResult<List<ArtistResponse>>> getArtists() {
    return _client.getArtists(artistIds);
  }

  void getAccessToken(void Function() onSuccess) {
    _client.getAccessToken(onSuccess);
  }

  Future<ApiResult<AlbumResponse>> getAlbum(String albumId) {
    return _client.getAlbum(albumId);
  }

}
