// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataListModel _$DataListModelFromJson(Map<String, dynamic> json) {
  return _DataListModel.fromJson(json);
}

/// @nodoc
mixin _$DataListModel {
  @JsonKey(name: "data")
  List<Datum> get data => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataListModelCopyWith<DataListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataListModelCopyWith<$Res> {
  factory $DataListModelCopyWith(
          DataListModel value, $Res Function(DataListModel) then) =
      _$DataListModelCopyWithImpl<$Res, DataListModel>;
  @useResult
  $Res call({@JsonKey(name: "data") List<Datum> data, int status});
}

/// @nodoc
class _$DataListModelCopyWithImpl<$Res, $Val extends DataListModel>
    implements $DataListModelCopyWith<$Res> {
  _$DataListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataListModelImplCopyWith<$Res>
    implements $DataListModelCopyWith<$Res> {
  factory _$$DataListModelImplCopyWith(
          _$DataListModelImpl value, $Res Function(_$DataListModelImpl) then) =
      __$$DataListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "data") List<Datum> data, int status});
}

/// @nodoc
class __$$DataListModelImplCopyWithImpl<$Res>
    extends _$DataListModelCopyWithImpl<$Res, _$DataListModelImpl>
    implements _$$DataListModelImplCopyWith<$Res> {
  __$$DataListModelImplCopyWithImpl(
      _$DataListModelImpl _value, $Res Function(_$DataListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$DataListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataListModelImpl implements _DataListModel {
  const _$DataListModelImpl(
      {@JsonKey(name: "data") required final List<Datum> data,
      required this.status})
      : _data = data;

  factory _$DataListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataListModelImplFromJson(json);

  final List<Datum> _data;
  @override
  @JsonKey(name: "data")
  List<Datum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int status;

  @override
  String toString() {
    return 'DataListModel(data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataListModelImplCopyWith<_$DataListModelImpl> get copyWith =>
      __$$DataListModelImplCopyWithImpl<_$DataListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataListModelImplToJson(
      this,
    );
  }
}

abstract class _DataListModel implements DataListModel {
  const factory _DataListModel(
      {@JsonKey(name: "data") required final List<Datum> data,
      required final int status}) = _$DataListModelImpl;

  factory _DataListModel.fromJson(Map<String, dynamic> json) =
      _$DataListModelImpl.fromJson;

  @override
  @JsonKey(name: "data")
  List<Datum> get data;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$DataListModelImplCopyWith<_$DataListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get banner => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "playlist")
  List<Playlist> get playlist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String banner,
      String logo,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "playlist") List<Playlist> playlist});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? banner = null,
    Object? logo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? playlist = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      playlist: null == playlist
          ? _value.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String description,
      String banner,
      String logo,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "playlist") List<Playlist> playlist});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? banner = null,
    Object? logo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? playlist = null,
  }) {
    return _then(_$DatumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      playlist: null == playlist
          ? _value._playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.banner,
      required this.logo,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "playlist") required final List<Playlist> playlist})
      : _playlist = playlist;

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String banner;
  @override
  final String logo;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  final List<Playlist> _playlist;
  @override
  @JsonKey(name: "playlist")
  List<Playlist> get playlist {
    if (_playlist is EqualUnmodifiableListView) return _playlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlist);
  }

  @override
  String toString() {
    return 'Datum(id: $id, title: $title, description: $description, banner: $banner, logo: $logo, createdAt: $createdAt, updatedAt: $updatedAt, playlist: $playlist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.banner, banner) || other.banner == banner) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._playlist, _playlist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      banner,
      logo,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_playlist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
          {required final int id,
          required final String title,
          required final String description,
          required final String banner,
          required final String logo,
          @JsonKey(name: "created_at") required final DateTime createdAt,
          @JsonKey(name: "updated_at") required final DateTime updatedAt,
          @JsonKey(name: "playlist") required final List<Playlist> playlist}) =
      _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get banner;
  @override
  String get logo;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "playlist")
  List<Playlist> get playlist;
  @override
  @JsonKey(ignore: true)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return _Playlist.fromJson(json);
}

/// @nodoc
mixin _$Playlist {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "dir_id")
  int get dirId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistCopyWith<Playlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistCopyWith<$Res> {
  factory $PlaylistCopyWith(Playlist value, $Res Function(Playlist) then) =
      _$PlaylistCopyWithImpl<$Res, Playlist>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "dir_id") int dirId,
      String title,
      String description,
      String url,
      String type,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt});
}

/// @nodoc
class _$PlaylistCopyWithImpl<$Res, $Val extends Playlist>
    implements $PlaylistCopyWith<$Res> {
  _$PlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dirId = null,
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dirId: null == dirId
          ? _value.dirId
          : dirId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistImplCopyWith<$Res>
    implements $PlaylistCopyWith<$Res> {
  factory _$$PlaylistImplCopyWith(
          _$PlaylistImpl value, $Res Function(_$PlaylistImpl) then) =
      __$$PlaylistImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "dir_id") int dirId,
      String title,
      String description,
      String url,
      String type,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt});
}

/// @nodoc
class __$$PlaylistImplCopyWithImpl<$Res>
    extends _$PlaylistCopyWithImpl<$Res, _$PlaylistImpl>
    implements _$$PlaylistImplCopyWith<$Res> {
  __$$PlaylistImplCopyWithImpl(
      _$PlaylistImpl _value, $Res Function(_$PlaylistImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dirId = null,
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PlaylistImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dirId: null == dirId
          ? _value.dirId
          : dirId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistImpl implements _Playlist {
  const _$PlaylistImpl(
      {required this.id,
      @JsonKey(name: "dir_id") required this.dirId,
      required this.title,
      required this.description,
      required this.url,
      required this.type,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$PlaylistImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "dir_id")
  final int dirId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String url;
  @override
  final String type;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Playlist(id: $id, dirId: $dirId, title: $title, description: $description, url: $url, type: $type, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dirId, dirId) || other.dirId == dirId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dirId, title, description,
      url, type, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      __$$PlaylistImplCopyWithImpl<_$PlaylistImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistImplToJson(
      this,
    );
  }
}

abstract class _Playlist implements Playlist {
  const factory _Playlist(
          {required final int id,
          @JsonKey(name: "dir_id") required final int dirId,
          required final String title,
          required final String description,
          required final String url,
          required final String type,
          @JsonKey(name: "created_at") required final DateTime createdAt,
          @JsonKey(name: "updated_at") required final DateTime updatedAt}) =
      _$PlaylistImpl;

  factory _Playlist.fromJson(Map<String, dynamic> json) =
      _$PlaylistImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "dir_id")
  int get dirId;
  @override
  String get title;
  @override
  String get description;
  @override
  String get url;
  @override
  String get type;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistImplCopyWith<_$PlaylistImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
