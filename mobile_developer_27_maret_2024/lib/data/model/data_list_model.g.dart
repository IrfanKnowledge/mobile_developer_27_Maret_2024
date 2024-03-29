// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataListModelImpl _$$DataListModelImplFromJson(Map<String, dynamic> json) =>
    _$DataListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int,
    );

Map<String, dynamic> _$$DataListModelImplToJson(_$DataListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      banner: json['banner'] as String,
      logo: json['logo'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      playlist: (json['playlist'] as List<dynamic>)
          .map((e) => Playlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'banner': instance.banner,
      'logo': instance.logo,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'playlist': instance.playlist,
    };

_$PlaylistImpl _$$PlaylistImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistImpl(
      id: json['id'] as int,
      dirId: json['dir_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PlaylistImplToJson(_$PlaylistImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dir_id': instance.dirId,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'type': instance.type,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
