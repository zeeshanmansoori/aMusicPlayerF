import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_state.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyService {
  String? _spToken;
  final String _clientId = "690a76366ff84bc3b279ec8ea11660a1";
  final String _redirectUrl = "com.zee.amusicplayer://z1";

  SpotifyService() {
    // _getToken();
  }

  Future<String> getToken() {
    return SpotifySdk.getAccessToken(
      clientId: _clientId,
      redirectUrl: _redirectUrl,
    );
  }

  Future<bool> connectToRemote() {
    return SpotifySdk.connectToSpotifyRemote(
      clientId: _clientId,
      redirectUrl: _redirectUrl,
      accessToken: _spToken,
    ).catchError((sf) {
      return false;
    });
  }

  void togglePlayingState(bool oldState) {
    if (oldState) {
      SpotifySdk.pause();
    } else {
      SpotifySdk.resume();
    }
  }

  Stream<PlayerState> getPlayerStatusAsStream() {
    return SpotifySdk.subscribePlayerState();
  }
}
