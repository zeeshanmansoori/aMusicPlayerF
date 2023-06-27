import 'package:shared_repo/models/Restrictions.dart';
import 'package:shared_repo/models/artist_response.dart';
import 'package:shared_repo/models/image_response.dart';

import 'ExternalUrls.dart';
import 'Tracks.dart';

class AlbumResponse {

  final String albumType;
  final int totalTracks;
  // final List<String> availableMarkets;
  final ExternalUrls? externalUrls;
  final String href;
  final String id;
  final List<ImageResponse> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final Restrictions? restrictions;
  final String type;
  final String uri;

  //List<Copyrights> copyrights;
  // ExternalIds externalIds;
  final List<String> genres;
  final String label;
  final int popularity;
  final List<ArtistResponse> artists;
  final Tracks? tracks;


  AlbumResponse({
    required this.albumType,
    required this.totalTracks,
    // required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.restrictions,
    required this.type,
    required this.uri,
    // required this.copyrights,
    // required this.externalIds,
    required this.genres,
    required this.label,
    required this.popularity,
    required this.artists,
    required this.tracks,
  });

  factory AlbumResponse.fromJson(dynamic json) {
    var albumType = json['album_type'];
    var totalTracks = json['total_tracks'];
    var externalUrls = json['external_urls'] != null
        ? ExternalUrls.fromJson(json['external_urls'])
        : null;
    var href = json['href'];
    var id = json['id'];
    var images = <ImageResponse>[];
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images.add(ImageResponse.fromJson(v));
      });
    }
    var name = json['name'];
    var releaseDate = json['release_date'];
    var releaseDatePrecision = json['release_date_precision'];
    var restrictions = json['restrictions'] != null
        ? Restrictions.fromJson(json['restrictions'])
        : null;
    var type = json['type'];
    var uri = json['uri'];
    // var copyrights = [];
    // if (json['copyrights'] != null) {
    //
    //   json['copyrights'].forEach((v) {
    //     copyrights.add(Copyrights.fromJson(v));
    //   });
    // }
    //var externalIds = json['external_ids'] != null ? ExternalIds.fromJson(json['external_ids']) : null;
    var genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    var label = json['label'];
    var popularity = json['popularity'];
    var artists = <ArtistResponse>[];
    if (json['artists'] != null) {
      json['artists'].forEach((v) {
        artists.add(ArtistResponse.fromJson(v));
      });
    }
    var tracks =
        json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null;
    return AlbumResponse(
      albumType: albumType,
      totalTracks: totalTracks,
      externalUrls: externalUrls,
      href: href,
      id: id,
      images: images,
      name: name,
      releaseDate: releaseDate,
      releaseDatePrecision: releaseDatePrecision,
      restrictions: restrictions,
      type: type,
      uri: uri,
      genres: genres,
      label: label,
      popularity: popularity,
      artists: artists,
      tracks: tracks,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['album_type'] = albumType;
    map['total_tracks'] = totalTracks;
    if (externalUrls != null) {
      map['external_urls'] = externalUrls!.toJson();
    }
    map['href'] = href;
    map['id'] = id;
    map['images'] = images.map((v) => v.toJson()).toList();
    map['name'] = name;
    map['release_date'] = releaseDate;
    map['release_date_precision'] = releaseDatePrecision;
    map['restrictions'] = restrictions?.toJson();
    map['type'] = type;
    map['uri'] = uri;
    // if (copyrights != null) {
    //   map['copyrights'] = copyrights.map((v) => v.toJson()).toList();
    // }
    // if (externalIds != null) {
    //   map['external_ids'] = externalIds.toJson();
    // }
    map['genres'] = genres;
    map['label'] = label;
    map['popularity'] = popularity;
    map['artists'] = artists.map((v) => v.toJson()).toList();
    map['tracks'] = tracks?.toJson();
    return map;
  }


  factory AlbumResponse.dummy(){
    var json =  {
      "album_type": "single",
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
          },
          "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
          "id": "1wRPtKGflJrBx9BmLsSwlU",
          "name": "Pritam",
          "type": "artist",
          "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
        }
      ],
      "copyrights": [
        {
          "text": "2023 Super Cassettes Industries Private Limited",
          "type": "C"
        },
        {
          "text": "2023 Super Cassettes Industries Private Limited",
          "type": "P"
        }
      ],
      "external_ids": {
        "upc": "8902894361903"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/album/1t1gWslYejaaqicumEbdKU"
      },
      "genres": [],
      "href": "https://api.spotify.com/v1/albums/1t1gWslYejaaqicumEbdKU",
      "id": "1t1gWslYejaaqicumEbdKU",
      "images": [
        {
          "height": 640,
          "url": "https://i.scdn.co/image/ab67616d0000b27360098f31391483986de30b66",
          "width": 640
        },
        {
          "height": 300,
          "url": "https://i.scdn.co/image/ab67616d00001e0260098f31391483986de30b66",
          "width": 300
        },
        {
          "height": 64,
          "url": "https://i.scdn.co/image/ab67616d0000485160098f31391483986de30b66",
          "width": 64
        }
      ],
      "label": "T-Series",
      "name": "Tu Jhoothi Main Makkaar",
      "popularity": 69,
      "release_date": "2023-03-16",
      "release_date_precision": "day",
      "total_tracks": 6,
      "tracks": {
        "href": "https://api.spotify.com/v1/albums/1t1gWslYejaaqicumEbdKU/tracks?offset=0&limit=50",
        "items": [
          {
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
                },
                "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
                "id": "1wRPtKGflJrBx9BmLsSwlU",
                "name": "Pritam",
                "type": "artist",
                "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/4YRxDV8wJFPHPTeXepOstw"
                },
                "href": "https://api.spotify.com/v1/artists/4YRxDV8wJFPHPTeXepOstw",
                "id": "4YRxDV8wJFPHPTeXepOstw",
                "name": "Arijit Singh",
                "type": "artist",
                "uri": "spotify:artist:4YRxDV8wJFPHPTeXepOstw"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/2fMqTqiTxUDlmcOEPaQSsx"
                },
                "href": "https://api.spotify.com/v1/artists/2fMqTqiTxUDlmcOEPaQSsx",
                "id": "2fMqTqiTxUDlmcOEPaQSsx",
                "name": "Amitabh Bhattacharya",
                "type": "artist",
                "uri": "spotify:artist:2fMqTqiTxUDlmcOEPaQSsx"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/3tPQOjkxO3mrYrrgkTeXgH"
                },
                "href": "https://api.spotify.com/v1/artists/3tPQOjkxO3mrYrrgkTeXgH",
                "id": "3tPQOjkxO3mrYrrgkTeXgH",
                "name": "Nikhita Gandhi",
                "type": "artist",
                "uri": "spotify:artist:3tPQOjkxO3mrYrrgkTeXgH"
              }
            ],
            "disc_number": 1,
            "duration_ms": 266094,
            "explicit": false,
            "external_urls": {
              "spotify": "https://open.spotify.com/track/7Myx7fMLEdkBrkMGK0zhZp"
            },
            "href": "https://api.spotify.com/v1/tracks/7Myx7fMLEdkBrkMGK0zhZp",
            "id": "7Myx7fMLEdkBrkMGK0zhZp",
            "is_local": false,
            "name": "Tere Pyaar Mein",
            "preview_url": "https://p.scdn.co/mp3-preview/934085d1005df2d8d0e94833795f9a155dd77d64?cid=690a76366ff84bc3b279ec8ea11660a1",
            "track_number": 1,
            "type": "track",
            "uri": "spotify:track:7Myx7fMLEdkBrkMGK0zhZp"
          },
          {
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
                },
                "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
                "id": "1wRPtKGflJrBx9BmLsSwlU",
                "name": "Pritam",
                "type": "artist",
                "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/4YRxDV8wJFPHPTeXepOstw"
                },
                "href": "https://api.spotify.com/v1/artists/4YRxDV8wJFPHPTeXepOstw",
                "id": "4YRxDV8wJFPHPTeXepOstw",
                "name": "Arijit Singh",
                "type": "artist",
                "uri": "spotify:artist:4YRxDV8wJFPHPTeXepOstw"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/2fMqTqiTxUDlmcOEPaQSsx"
                },
                "href": "https://api.spotify.com/v1/artists/2fMqTqiTxUDlmcOEPaQSsx",
                "id": "2fMqTqiTxUDlmcOEPaQSsx",
                "name": "Amitabh Bhattacharya",
                "type": "artist",
                "uri": "spotify:artist:2fMqTqiTxUDlmcOEPaQSsx"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/3hbwOFtgWSNfeRzF2o7Y65"
                },
                "href": "https://api.spotify.com/v1/artists/3hbwOFtgWSNfeRzF2o7Y65",
                "id": "3hbwOFtgWSNfeRzF2o7Y65",
                "name": "Charan",
                "type": "artist",
                "uri": "spotify:artist:3hbwOFtgWSNfeRzF2o7Y65"
              }
            ],
            "disc_number": 1,
            "duration_ms": 216270,
            "explicit": false,
            "external_urls": {
              "spotify": "https://open.spotify.com/track/7zXcLSiKnMtmrmRQ0DieS9"
            },
            "href": "https://api.spotify.com/v1/tracks/7zXcLSiKnMtmrmRQ0DieS9",
            "id": "7zXcLSiKnMtmrmRQ0DieS9",
            "is_local": false,
            "name": "Pyaar Hota Kayi Baar Hai",
            "preview_url": "https://p.scdn.co/mp3-preview/321816e6c7e2b4480fff5842d6befcae8625affa?cid=690a76366ff84bc3b279ec8ea11660a1",
            "track_number": 2,
            "type": "track",
            "uri": "spotify:track:7zXcLSiKnMtmrmRQ0DieS9"
          },
          {
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
                },
                "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
                "id": "1wRPtKGflJrBx9BmLsSwlU",
                "name": "Pritam",
                "type": "artist",
                "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/4YRxDV8wJFPHPTeXepOstw"
                },
                "href": "https://api.spotify.com/v1/artists/4YRxDV8wJFPHPTeXepOstw",
                "id": "4YRxDV8wJFPHPTeXepOstw",
                "name": "Arijit Singh",
                "type": "artist",
                "uri": "spotify:artist:4YRxDV8wJFPHPTeXepOstw"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/2fMqTqiTxUDlmcOEPaQSsx"
                },
                "href": "https://api.spotify.com/v1/artists/2fMqTqiTxUDlmcOEPaQSsx",
                "id": "2fMqTqiTxUDlmcOEPaQSsx",
                "name": "Amitabh Bhattacharya",
                "type": "artist",
                "uri": "spotify:artist:2fMqTqiTxUDlmcOEPaQSsx"
              }
            ],
            "disc_number": 1,
            "duration_ms": 313051,
            "explicit": false,
            "external_urls": {
              "spotify": "https://open.spotify.com/track/0M3u0bKjztsp4GKhsLQDoB"
            },
            "href": "https://api.spotify.com/v1/tracks/0M3u0bKjztsp4GKhsLQDoB",
            "id": "0M3u0bKjztsp4GKhsLQDoB",
            "is_local": false,
            "name": "O Bedardeya",
            "preview_url": "https://p.scdn.co/mp3-preview/2b2d3ee9208599589f8ae0cdce23390281f05f10?cid=690a76366ff84bc3b279ec8ea11660a1",
            "track_number": 3,
            "type": "track",
            "uri": "spotify:track:0M3u0bKjztsp4GKhsLQDoB"
          },
          {
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
                },
                "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
                "id": "1wRPtKGflJrBx9BmLsSwlU",
                "name": "Pritam",
                "type": "artist",
                "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/2fMqTqiTxUDlmcOEPaQSsx"
                },
                "href": "https://api.spotify.com/v1/artists/2fMqTqiTxUDlmcOEPaQSsx",
                "id": "2fMqTqiTxUDlmcOEPaQSsx",
                "name": "Amitabh Bhattacharya",
                "type": "artist",
                "uri": "spotify:artist:2fMqTqiTxUDlmcOEPaQSsx"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/3eDT9fwXKuHWFvgZaaYC5v"
                },
                "href": "https://api.spotify.com/v1/artists/3eDT9fwXKuHWFvgZaaYC5v",
                "id": "3eDT9fwXKuHWFvgZaaYC5v",
                "name": "Sunidhi Chauhan",
                "type": "artist",
                "uri": "spotify:artist:3eDT9fwXKuHWFvgZaaYC5v"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/6iv4lysB1yHXoZJ2gfqTdh"
                },
                "href": "https://api.spotify.com/v1/artists/6iv4lysB1yHXoZJ2gfqTdh",
                "id": "6iv4lysB1yHXoZJ2gfqTdh",
                "name": "Shashwat Singh",
                "type": "artist",
                "uri": "spotify:artist:6iv4lysB1yHXoZJ2gfqTdh"
              }
            ],
            "disc_number": 1,
            "duration_ms": 236100,
            "explicit": false,
            "external_urls": {
              "spotify": "https://open.spotify.com/track/6Y1Dj1gxYqfPvAYtWPDBHZ"
            },
            "href": "https://api.spotify.com/v1/tracks/6Y1Dj1gxYqfPvAYtWPDBHZ",
            "id": "6Y1Dj1gxYqfPvAYtWPDBHZ",
            "is_local": false,
            "name": "Show Me The Thumka",
            "preview_url": "https://p.scdn.co/mp3-preview/8f2b205acee4e908f4c7c8293e5cc4e34074e8dd?cid=690a76366ff84bc3b279ec8ea11660a1",
            "track_number": 4,
            "type": "track",
            "uri": "spotify:track:6Y1Dj1gxYqfPvAYtWPDBHZ"
          },
          {
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
                },
                "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
                "id": "1wRPtKGflJrBx9BmLsSwlU",
                "name": "Pritam",
                "type": "artist",
                "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1tqysapcCh1lWEAc9dIFpa"
                },
                "href": "https://api.spotify.com/v1/artists/1tqysapcCh1lWEAc9dIFpa",
                "id": "1tqysapcCh1lWEAc9dIFpa",
                "name": "Jubin Nautiyal",
                "type": "artist",
                "uri": "spotify:artist:1tqysapcCh1lWEAc9dIFpa"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/2fMqTqiTxUDlmcOEPaQSsx"
                },
                "href": "https://api.spotify.com/v1/artists/2fMqTqiTxUDlmcOEPaQSsx",
                "id": "2fMqTqiTxUDlmcOEPaQSsx",
                "name": "Amitabh Bhattacharya",
                "type": "artist",
                "uri": "spotify:artist:2fMqTqiTxUDlmcOEPaQSsx"
              }
            ],
            "disc_number": 1,
            "duration_ms": 222375,
            "explicit": false,
            "external_urls": {
              "spotify": "https://open.spotify.com/track/5iydgkuP2lJFDT9CgyY26x"
            },
            "href": "https://api.spotify.com/v1/tracks/5iydgkuP2lJFDT9CgyY26x",
            "id": "5iydgkuP2lJFDT9CgyY26x",
            "is_local": false,
            "name": "Jaadui",
            "preview_url": "https://p.scdn.co/mp3-preview/97ef01676bfafc64f83c4dcccf301452dbd6abd1?cid=690a76366ff84bc3b279ec8ea11660a1",
            "track_number": 5,
            "type": "track",
            "uri": "spotify:track:5iydgkuP2lJFDT9CgyY26x"
          },
          {
            "artists": [
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/1wRPtKGflJrBx9BmLsSwlU"
                },
                "href": "https://api.spotify.com/v1/artists/1wRPtKGflJrBx9BmLsSwlU",
                "id": "1wRPtKGflJrBx9BmLsSwlU",
                "name": "Pritam",
                "type": "artist",
                "uri": "spotify:artist:1wRPtKGflJrBx9BmLsSwlU"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/0oOet2f43PA68X5RxKobEy"
                },
                "href": "https://api.spotify.com/v1/artists/0oOet2f43PA68X5RxKobEy",
                "id": "0oOet2f43PA68X5RxKobEy",
                "name": "Shreya Ghoshal",
                "type": "artist",
                "uri": "spotify:artist:0oOet2f43PA68X5RxKobEy"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/2fMqTqiTxUDlmcOEPaQSsx"
                },
                "href": "https://api.spotify.com/v1/artists/2fMqTqiTxUDlmcOEPaQSsx",
                "id": "2fMqTqiTxUDlmcOEPaQSsx",
                "name": "Amitabh Bhattacharya",
                "type": "artist",
                "uri": "spotify:artist:2fMqTqiTxUDlmcOEPaQSsx"
              },
              {
                "external_urls": {
                  "spotify": "https://open.spotify.com/artist/0NErdIJtuKBjtxKmlqaWdj"
                },
                "href": "https://api.spotify.com/v1/artists/0NErdIJtuKBjtxKmlqaWdj",
                "id": "0NErdIJtuKBjtxKmlqaWdj",
                "name": "Divya Kumar",
                "type": "artist",
                "uri": "spotify:artist:0NErdIJtuKBjtxKmlqaWdj"
              }
            ],
            "disc_number": 1,
            "duration_ms": 247714,
            "explicit": false,
            "external_urls": {
              "spotify": "https://open.spotify.com/track/0OezGqk104NQrcaLpWuYL4"
            },
            "href": "https://api.spotify.com/v1/tracks/0OezGqk104NQrcaLpWuYL4",
            "id": "0OezGqk104NQrcaLpWuYL4",
            "is_local": false,
            "name": "Maine Pi Rakhi Hai",
            "preview_url": "https://p.scdn.co/mp3-preview/3a69221cfc04788bd6f5d5ad6dddcffa28027866?cid=690a76366ff84bc3b279ec8ea11660a1",
            "track_number": 6,
            "type": "track",
            "uri": "spotify:track:0OezGqk104NQrcaLpWuYL4"
          }
        ],
        "limit": 50,
        "next": null,
        "offset": 0,
        "previous": null,
        "total": 6
      },
      "type": "album",
      "uri": "spotify:album:1t1gWslYejaaqicumEbdKU"
    };

    return AlbumResponse.fromJson(json);
  }
}
