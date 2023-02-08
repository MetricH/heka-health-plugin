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
// ignore: invalid_annotation_target
  @JsonKey(name: 'uuid')
  String get userUuid => throw _privateConstructorUsedError;
  Map<String, ConnectedPlatform?> get connections =>
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
      {@JsonKey(name: 'uuid') String userUuid,
      Map<String, ConnectedPlatform?> connections});
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
    Object? userUuid = null,
    Object? connections = null,
  }) {
    return _then(_value.copyWith(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      connections: null == connections
          ? _value.connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<String, ConnectedPlatform?>,
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
      {@JsonKey(name: 'uuid') String userUuid,
      Map<String, ConnectedPlatform?> connections});
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
    Object? userUuid = null,
    Object? connections = null,
  }) {
    return _then(_$_Connection(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
      connections: null == connections
          ? _value._connections
          : connections // ignore: cast_nullable_to_non_nullable
              as Map<String, ConnectedPlatform?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Connection extends _Connection {
  const _$_Connection(
      {@JsonKey(name: 'uuid') required this.userUuid,
      required final Map<String, ConnectedPlatform?> connections})
      : _connections = connections,
        super._();

  factory _$_Connection.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectionFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'uuid')
  final String userUuid;
  final Map<String, ConnectedPlatform?> _connections;
  @override
  Map<String, ConnectedPlatform?> get connections {
    if (_connections is EqualUnmodifiableMapView) return _connections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_connections);
  }

  @override
  String toString() {
    return 'Connection(userUuid: $userUuid, connections: $connections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Connection &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid) &&
            const DeepCollectionEquality()
                .equals(other._connections, _connections));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userUuid, const DeepCollectionEquality().hash(_connections));

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
          {@JsonKey(name: 'uuid') required final String userUuid,
          required final Map<String, ConnectedPlatform?> connections}) =
      _$_Connection;
  const _Connection._() : super._();

  factory _Connection.fromJson(Map<String, dynamic> json) =
      _$_Connection.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'uuid')
  String get userUuid;
  @override
  Map<String, ConnectedPlatform?> get connections;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionCopyWith<_$_Connection> get copyWith =>
      throw _privateConstructorUsedError;
}
