// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ios_connect_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IosConnectState {
  String get userUuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) permissionsDenied,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(Connection connection, String userUuid)
        syncingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? permissionsDenied,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(Connection connection, String userUuid)? syncingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? permissionsDenied,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(Connection connection, String userUuid)? syncingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PermissionsDenied value) permissionsDenied,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_SyncingData value) syncingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PermissionsDenied value)? permissionsDenied,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_SyncingData value)? syncingData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PermissionsDenied value)? permissionsDenied,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_SyncingData value)? syncingData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IosConnectStateCopyWith<IosConnectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IosConnectStateCopyWith<$Res> {
  factory $IosConnectStateCopyWith(
          IosConnectState value, $Res Function(IosConnectState) then) =
      _$IosConnectStateCopyWithImpl<$Res, IosConnectState>;
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class _$IosConnectStateCopyWithImpl<$Res, $Val extends IosConnectState>
    implements $IosConnectStateCopyWith<$Res> {
  _$IosConnectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_value.copyWith(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $IosConnectStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$IosConnectStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$_Initial(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'IosConnectState.initial(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) permissionsDenied,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(Connection connection, String userUuid)
        syncingData,
  }) {
    return initial(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? permissionsDenied,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(Connection connection, String userUuid)? syncingData,
  }) {
    return initial?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? permissionsDenied,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(Connection connection, String userUuid)? syncingData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PermissionsDenied value) permissionsDenied,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_SyncingData value) syncingData,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PermissionsDenied value)? permissionsDenied,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_SyncingData value)? syncingData,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PermissionsDenied value)? permissionsDenied,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_SyncingData value)? syncingData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements IosConnectState {
  const factory _Initial({required final String userUuid}) = _$_Initial;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PermissionsDeniedCopyWith<$Res>
    implements $IosConnectStateCopyWith<$Res> {
  factory _$$_PermissionsDeniedCopyWith(_$_PermissionsDenied value,
          $Res Function(_$_PermissionsDenied) then) =
      __$$_PermissionsDeniedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$_PermissionsDeniedCopyWithImpl<$Res>
    extends _$IosConnectStateCopyWithImpl<$Res, _$_PermissionsDenied>
    implements _$$_PermissionsDeniedCopyWith<$Res> {
  __$$_PermissionsDeniedCopyWithImpl(
      _$_PermissionsDenied _value, $Res Function(_$_PermissionsDenied) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$_PermissionsDenied(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PermissionsDenied implements _PermissionsDenied {
  const _$_PermissionsDenied({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'IosConnectState.permissionsDenied(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PermissionsDenied &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionsDeniedCopyWith<_$_PermissionsDenied> get copyWith =>
      __$$_PermissionsDeniedCopyWithImpl<_$_PermissionsDenied>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) permissionsDenied,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(Connection connection, String userUuid)
        syncingData,
  }) {
    return permissionsDenied(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? permissionsDenied,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(Connection connection, String userUuid)? syncingData,
  }) {
    return permissionsDenied?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? permissionsDenied,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(Connection connection, String userUuid)? syncingData,
    required TResult orElse(),
  }) {
    if (permissionsDenied != null) {
      return permissionsDenied(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PermissionsDenied value) permissionsDenied,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_SyncingData value) syncingData,
  }) {
    return permissionsDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PermissionsDenied value)? permissionsDenied,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_SyncingData value)? syncingData,
  }) {
    return permissionsDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PermissionsDenied value)? permissionsDenied,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_SyncingData value)? syncingData,
    required TResult orElse(),
  }) {
    if (permissionsDenied != null) {
      return permissionsDenied(this);
    }
    return orElse();
  }
}

abstract class _PermissionsDenied implements IosConnectState {
  const factory _PermissionsDenied({required final String userUuid}) =
      _$_PermissionsDenied;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionsDeniedCopyWith<_$_PermissionsDenied> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckingConnectionCopyWith<$Res>
    implements $IosConnectStateCopyWith<$Res> {
  factory _$$_CheckingConnectionCopyWith(_$_CheckingConnection value,
          $Res Function(_$_CheckingConnection) then) =
      __$$_CheckingConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$_CheckingConnectionCopyWithImpl<$Res>
    extends _$IosConnectStateCopyWithImpl<$Res, _$_CheckingConnection>
    implements _$$_CheckingConnectionCopyWith<$Res> {
  __$$_CheckingConnectionCopyWithImpl(
      _$_CheckingConnection _value, $Res Function(_$_CheckingConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$_CheckingConnection(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckingConnection implements _CheckingConnection {
  const _$_CheckingConnection({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'IosConnectState.checkingConnection(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckingConnection &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckingConnectionCopyWith<_$_CheckingConnection> get copyWith =>
      __$$_CheckingConnectionCopyWithImpl<_$_CheckingConnection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) permissionsDenied,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(Connection connection, String userUuid)
        syncingData,
  }) {
    return checkingConnection(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? permissionsDenied,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(Connection connection, String userUuid)? syncingData,
  }) {
    return checkingConnection?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? permissionsDenied,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(Connection connection, String userUuid)? syncingData,
    required TResult orElse(),
  }) {
    if (checkingConnection != null) {
      return checkingConnection(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PermissionsDenied value) permissionsDenied,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_SyncingData value) syncingData,
  }) {
    return checkingConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PermissionsDenied value)? permissionsDenied,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_SyncingData value)? syncingData,
  }) {
    return checkingConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PermissionsDenied value)? permissionsDenied,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_SyncingData value)? syncingData,
    required TResult orElse(),
  }) {
    if (checkingConnection != null) {
      return checkingConnection(this);
    }
    return orElse();
  }
}

abstract class _CheckingConnection implements IosConnectState {
  const factory _CheckingConnection({required final String userUuid}) =
      _$_CheckingConnection;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$_CheckingConnectionCopyWith<_$_CheckingConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MakingConnectionCopyWith<$Res>
    implements $IosConnectStateCopyWith<$Res> {
  factory _$$_MakingConnectionCopyWith(
          _$_MakingConnection value, $Res Function(_$_MakingConnection) then) =
      __$$_MakingConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$_MakingConnectionCopyWithImpl<$Res>
    extends _$IosConnectStateCopyWithImpl<$Res, _$_MakingConnection>
    implements _$$_MakingConnectionCopyWith<$Res> {
  __$$_MakingConnectionCopyWithImpl(
      _$_MakingConnection _value, $Res Function(_$_MakingConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$_MakingConnection(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MakingConnection implements _MakingConnection {
  const _$_MakingConnection({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'IosConnectState.makingConnection(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MakingConnection &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MakingConnectionCopyWith<_$_MakingConnection> get copyWith =>
      __$$_MakingConnectionCopyWithImpl<_$_MakingConnection>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) permissionsDenied,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(Connection connection, String userUuid)
        syncingData,
  }) {
    return makingConnection(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? permissionsDenied,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(Connection connection, String userUuid)? syncingData,
  }) {
    return makingConnection?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? permissionsDenied,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(Connection connection, String userUuid)? syncingData,
    required TResult orElse(),
  }) {
    if (makingConnection != null) {
      return makingConnection(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PermissionsDenied value) permissionsDenied,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_SyncingData value) syncingData,
  }) {
    return makingConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PermissionsDenied value)? permissionsDenied,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_SyncingData value)? syncingData,
  }) {
    return makingConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PermissionsDenied value)? permissionsDenied,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_SyncingData value)? syncingData,
    required TResult orElse(),
  }) {
    if (makingConnection != null) {
      return makingConnection(this);
    }
    return orElse();
  }
}

abstract class _MakingConnection implements IosConnectState {
  const factory _MakingConnection({required final String userUuid}) =
      _$_MakingConnection;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$_MakingConnectionCopyWith<_$_MakingConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SyncingDataCopyWith<$Res>
    implements $IosConnectStateCopyWith<$Res> {
  factory _$$_SyncingDataCopyWith(
          _$_SyncingData value, $Res Function(_$_SyncingData) then) =
      __$$_SyncingDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Connection connection, String userUuid});

  $ConnectionCopyWith<$Res> get connection;
}

/// @nodoc
class __$$_SyncingDataCopyWithImpl<$Res>
    extends _$IosConnectStateCopyWithImpl<$Res, _$_SyncingData>
    implements _$$_SyncingDataCopyWith<$Res> {
  __$$_SyncingDataCopyWithImpl(
      _$_SyncingData _value, $Res Function(_$_SyncingData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connection = null,
    Object? userUuid = null,
  }) {
    return _then(_$_SyncingData(
      null == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as Connection,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectionCopyWith<$Res> get connection {
    return $ConnectionCopyWith<$Res>(_value.connection, (value) {
      return _then(_value.copyWith(connection: value));
    });
  }
}

/// @nodoc

class _$_SyncingData implements _SyncingData {
  const _$_SyncingData(this.connection, {required this.userUuid});

  @override
  final Connection connection;
  @override
  final String userUuid;

  @override
  String toString() {
    return 'IosConnectState.syncingData(connection: $connection, userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncingData &&
            (identical(other.connection, connection) ||
                other.connection == connection) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, connection, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyncingDataCopyWith<_$_SyncingData> get copyWith =>
      __$$_SyncingDataCopyWithImpl<_$_SyncingData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) permissionsDenied,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(Connection connection, String userUuid)
        syncingData,
  }) {
    return syncingData(connection, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? permissionsDenied,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(Connection connection, String userUuid)? syncingData,
  }) {
    return syncingData?.call(connection, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? permissionsDenied,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(Connection connection, String userUuid)? syncingData,
    required TResult orElse(),
  }) {
    if (syncingData != null) {
      return syncingData(connection, userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_PermissionsDenied value) permissionsDenied,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_SyncingData value) syncingData,
  }) {
    return syncingData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_PermissionsDenied value)? permissionsDenied,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_SyncingData value)? syncingData,
  }) {
    return syncingData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_PermissionsDenied value)? permissionsDenied,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_SyncingData value)? syncingData,
    required TResult orElse(),
  }) {
    if (syncingData != null) {
      return syncingData(this);
    }
    return orElse();
  }
}

abstract class _SyncingData implements IosConnectState {
  const factory _SyncingData(final Connection connection,
      {required final String userUuid}) = _$_SyncingData;

  Connection get connection;
  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$_SyncingDataCopyWith<_$_SyncingData> get copyWith =>
      throw _privateConstructorUsedError;
}
