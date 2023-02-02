// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return _Connection.fromJson(json);
}

/// @nodoc
mixin _$Connection {
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'user_uuid')
  String get userUuid =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'google_fit_refresh_token')
  String? get googleFitRefreshToken => throw _privateConstructorUsedError;
  int get app => throw _privateConstructorUsedError;
  @JsonKey(name: 'connected_platforms')
  List<ConnectedPlatform> get connectedPlatforms =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionCopyWith<Connection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionCopyWith<$Res> {
  factory $ConnectionCopyWith(
          Connection value, $Res Function(Connection) then) =
      _$ConnectionCopyWithImpl<$Res, Connection>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_uuid')
          String userUuid,
      @JsonKey(name: 'google_fit_refresh_token')
          String? googleFitRefreshToken,
      int app,
      @JsonKey(name: 'connected_platforms')
          List<ConnectedPlatform> connectedPlatforms});
}

/// @nodoc
class _$ConnectionCopyWithImpl<$Res, $Val extends Connection>
    implements $ConnectionCopyWith<$Res> {
  _$ConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUuid = null,
    Object? googleFitRefreshToken = freezed,
    Object? app = null,
    Object? connectedPlatforms = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      googleFitRefreshToken: freezed == googleFitRefreshToken
          ? _value.googleFitRefreshToken
          : googleFitRefreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as int,
      connectedPlatforms: null == connectedPlatforms
          ? _value.connectedPlatforms
          : connectedPlatforms // ignore: cast_nullable_to_non_nullable
              as List<ConnectedPlatform>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectionCopyWith<$Res>
    implements $ConnectionCopyWith<$Res> {
  factory _$$_ConnectionCopyWith(
          _$_Connection value, $Res Function(_$_Connection) then) =
      __$$_ConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_uuid')
          String userUuid,
      @JsonKey(name: 'google_fit_refresh_token')
          String? googleFitRefreshToken,
      int app,
      @JsonKey(name: 'connected_platforms')
          List<ConnectedPlatform> connectedPlatforms});
}

/// @nodoc
class __$$_ConnectionCopyWithImpl<$Res>
    extends _$ConnectionCopyWithImpl<$Res, _$_Connection>
    implements _$$_ConnectionCopyWith<$Res> {
  __$$_ConnectionCopyWithImpl(
      _$_Connection _value, $Res Function(_$_Connection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userUuid = null,
    Object? googleFitRefreshToken = freezed,
    Object? app = null,
    Object? connectedPlatforms = null,
  }) {
    return _then(_$_Connection(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      googleFitRefreshToken: freezed == googleFitRefreshToken
          ? _value.googleFitRefreshToken
          : googleFitRefreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      app: null == app
          ? _value.app
          : app // ignore: cast_nullable_to_non_nullable
              as int,
      connectedPlatforms: null == connectedPlatforms
          ? _value._connectedPlatforms
          : connectedPlatforms // ignore: cast_nullable_to_non_nullable
              as List<ConnectedPlatform>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Connection extends _Connection {
  const _$_Connection(
      {required this.id,
      @JsonKey(name: 'user_uuid')
          required this.userUuid,
      @JsonKey(name: 'google_fit_refresh_token')
          this.googleFitRefreshToken,
      required this.app,
      @JsonKey(name: 'connected_platforms')
          required final List<ConnectedPlatform> connectedPlatforms})
      : _connectedPlatforms = connectedPlatforms,
        super._();

  factory _$_Connection.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectionFromJson(json);

  @override
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'user_uuid')
  final String userUuid;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'google_fit_refresh_token')
  final String? googleFitRefreshToken;
  @override
  final int app;
  final List<ConnectedPlatform> _connectedPlatforms;
  @override
  @JsonKey(name: 'connected_platforms')
  List<ConnectedPlatform> get connectedPlatforms {
    if (_connectedPlatforms is EqualUnmodifiableListView)
      return _connectedPlatforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connectedPlatforms);
  }

  @override
  String toString() {
    return 'Connection(id: $id, userUuid: $userUuid, googleFitRefreshToken: $googleFitRefreshToken, app: $app, connectedPlatforms: $connectedPlatforms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Connection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            (identical(other.googleFitRefreshToken, googleFitRefreshToken) ||
                other.googleFitRefreshToken == googleFitRefreshToken) &&
            (identical(other.app, app) || other.app == app) &&
            const DeepCollectionEquality()
                .equals(other._connectedPlatforms, _connectedPlatforms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userUuid,
      googleFitRefreshToken,
      app,
      const DeepCollectionEquality().hash(_connectedPlatforms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectionCopyWith<_$_Connection> get copyWith =>
      __$$_ConnectionCopyWithImpl<_$_Connection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectionToJson(
      this,
    );
  }
}

abstract class _Connection extends Connection {
  const factory _Connection(
          {required final int id,
          @JsonKey(name: 'user_uuid')
              required final String userUuid,
          @JsonKey(name: 'google_fit_refresh_token')
              final String? googleFitRefreshToken,
          required final int app,
          @JsonKey(name: 'connected_platforms')
              required final List<ConnectedPlatform> connectedPlatforms}) =
      _$_Connection;
  const _Connection._() : super._();

  factory _Connection.fromJson(Map<String, dynamic> json) =
      _$_Connection.fromJson;

  @override
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'user_uuid')
  String get userUuid;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'google_fit_refresh_token')
  String? get googleFitRefreshToken;
  @override
  int get app;
  @override
  @JsonKey(name: 'connected_platforms')
  List<ConnectedPlatform> get connectedPlatforms;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionCopyWith<_$_Connection> get copyWith =>
      throw _privateConstructorUsedError;
}
