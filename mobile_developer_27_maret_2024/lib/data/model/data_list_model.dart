import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_list_model.freezed.dart';

part 'data_list_model.g.dart';

// part 'datum.freezed.dart';
//
// part 'datum.g.dart';
//
// part 'playlist.freezed.dart';
//
// part 'playlist.g.dart';

@freezed
class DataListModel with _$DataListModel {
  const factory DataListModel({
    @JsonKey(name: "data") required List<Datum> data,
    required int status,
  }) = _DataListModel;

  factory DataListModel.fromRawJson(String str) =>
      DataListModel.fromJson(json.decode(str));

  factory DataListModel.fromJson(Map<String, dynamic> json) =>
      _$DataListModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    required int id,
    required String title,
    required String description,
    required String banner,
    required String logo,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
    @JsonKey(name: "playlist") required List<Playlist> playlist,
  }) = _Datum;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Playlist with _$Playlist {
  const factory Playlist({
    required int id,
    @JsonKey(name: "dir_id") required int dirId,
    required String title,
    required String description,
    required String url,
    required String type,
    @JsonKey(name: "created_at") required DateTime createdAt,
    @JsonKey(name: "updated_at") required DateTime updatedAt,
  }) = _Playlist;

  factory Playlist.fromRawJson(String str) =>
      Playlist.fromJson(json.decode(str));

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
}
