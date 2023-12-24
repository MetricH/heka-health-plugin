// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heka_platform_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HekaPlatformState {
  String get userUuid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HekaPlatformStateCopyWith<HekaPlatformState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HekaPlatformStateCopyWith<$Res> {
  factory $HekaPlatformStateCopyWith(
          HekaPlatformState value, $Res Function(HekaPlatformState) then) =
      _$HekaPlatformStateCopyWithImpl<$Res, HekaPlatformState>;
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class _$HekaPlatformStateCopyWithImpl<$Res, $Val extends HekaPlatformState>
    implements $HekaPlatformStateCopyWith<$Res> {
  _$HekaPlatformStateCopyWithImpl(this._value, this._then);

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
abstract class _$$InitialImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$InitialImpl(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.initial(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return initial(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return initial?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
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
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HekaPlatformState {
  const factory _Initial({required final String userUuid}) = _$InitialImpl;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckingConnectionImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$CheckingConnectionImplCopyWith(_$CheckingConnectionImpl value,
          $Res Function(_$CheckingConnectionImpl) then) =
      __$$CheckingConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$CheckingConnectionImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$CheckingConnectionImpl>
    implements _$$CheckingConnectionImplCopyWith<$Res> {
  __$$CheckingConnectionImplCopyWithImpl(_$CheckingConnectionImpl _value,
      $Res Function(_$CheckingConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$CheckingConnectionImpl(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckingConnectionImpl implements _CheckingConnection {
  const _$CheckingConnectionImpl({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.checkingConnection(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckingConnectionImpl &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckingConnectionImplCopyWith<_$CheckingConnectionImpl> get copyWith =>
      __$$CheckingConnectionImplCopyWithImpl<_$CheckingConnectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return checkingConnection(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return checkingConnection?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
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
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return checkingConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return checkingConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (checkingConnection != null) {
      return checkingConnection(this);
    }
    return orElse();
  }
}

abstract class _CheckingConnection implements HekaPlatformState {
  const factory _CheckingConnection({required final String userUuid}) =
      _$CheckingConnectionImpl;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$CheckingConnectionImplCopyWith<_$CheckingConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoConnectionImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
          _$NoConnectionImpl value, $Res Function(_$NoConnectionImpl) then) =
      __$$NoConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$NoConnectionImpl>
    implements _$$NoConnectionImplCopyWith<$Res> {
  __$$NoConnectionImplCopyWithImpl(
      _$NoConnectionImpl _value, $Res Function(_$NoConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$NoConnectionImpl(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoConnectionImpl implements _NoConnection {
  const _$NoConnectionImpl({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.noConnection(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoConnectionImpl &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoConnectionImplCopyWith<_$NoConnectionImpl> get copyWith =>
      __$$NoConnectionImplCopyWithImpl<_$NoConnectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return noConnection(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return noConnection?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection implements HekaPlatformState {
  const factory _NoConnection({required final String userUuid}) =
      _$NoConnectionImpl;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$NoConnectionImplCopyWith<_$NoConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TokenInvalidatedImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$TokenInvalidatedImplCopyWith(_$TokenInvalidatedImpl value,
          $Res Function(_$TokenInvalidatedImpl) then) =
      __$$TokenInvalidatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConnectedPlatform connection, String userUuid});

  $ConnectedPlatformCopyWith<$Res> get connection;
}

/// @nodoc
class __$$TokenInvalidatedImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$TokenInvalidatedImpl>
    implements _$$TokenInvalidatedImplCopyWith<$Res> {
  __$$TokenInvalidatedImplCopyWithImpl(_$TokenInvalidatedImpl _value,
      $Res Function(_$TokenInvalidatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connection = null,
    Object? userUuid = null,
  }) {
    return _then(_$TokenInvalidatedImpl(
      null == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as ConnectedPlatform,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectedPlatformCopyWith<$Res> get connection {
    return $ConnectedPlatformCopyWith<$Res>(_value.connection, (value) {
      return _then(_value.copyWith(connection: value));
    });
  }
}

/// @nodoc

class _$TokenInvalidatedImpl implements _TokenInvalidated {
  const _$TokenInvalidatedImpl(this.connection, {required this.userUuid});

  @override
  final ConnectedPlatform connection;
  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.tokenInvalidated(connection: $connection, userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenInvalidatedImpl &&
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
  _$$TokenInvalidatedImplCopyWith<_$TokenInvalidatedImpl> get copyWith =>
      __$$TokenInvalidatedImplCopyWithImpl<_$TokenInvalidatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return tokenInvalidated(connection, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return tokenInvalidated?.call(connection, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
    required TResult orElse(),
  }) {
    if (tokenInvalidated != null) {
      return tokenInvalidated(connection, userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return tokenInvalidated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return tokenInvalidated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (tokenInvalidated != null) {
      return tokenInvalidated(this);
    }
    return orElse();
  }
}

abstract class _TokenInvalidated implements HekaPlatformState {
  const factory _TokenInvalidated(final ConnectedPlatform connection,
      {required final String userUuid}) = _$TokenInvalidatedImpl;

  ConnectedPlatform get connection;
  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$TokenInvalidatedImplCopyWith<_$TokenInvalidatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MakingConnectionImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$MakingConnectionImplCopyWith(_$MakingConnectionImpl value,
          $Res Function(_$MakingConnectionImpl) then) =
      __$$MakingConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$MakingConnectionImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$MakingConnectionImpl>
    implements _$$MakingConnectionImplCopyWith<$Res> {
  __$$MakingConnectionImplCopyWithImpl(_$MakingConnectionImpl _value,
      $Res Function(_$MakingConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$MakingConnectionImpl(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MakingConnectionImpl implements _MakingConnection {
  const _$MakingConnectionImpl({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.makingConnection(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MakingConnectionImpl &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MakingConnectionImplCopyWith<_$MakingConnectionImpl> get copyWith =>
      __$$MakingConnectionImplCopyWithImpl<_$MakingConnectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return makingConnection(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return makingConnection?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
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
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return makingConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return makingConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (makingConnection != null) {
      return makingConnection(this);
    }
    return orElse();
  }
}

abstract class _MakingConnection implements HekaPlatformState {
  const factory _MakingConnection({required final String userUuid}) =
      _$MakingConnectionImpl;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$MakingConnectionImplCopyWith<_$MakingConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DisconnectingImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$DisconnectingImplCopyWith(
          _$DisconnectingImpl value, $Res Function(_$DisconnectingImpl) then) =
      __$$DisconnectingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userUuid});
}

/// @nodoc
class __$$DisconnectingImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$DisconnectingImpl>
    implements _$$DisconnectingImplCopyWith<$Res> {
  __$$DisconnectingImplCopyWithImpl(
      _$DisconnectingImpl _value, $Res Function(_$DisconnectingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userUuid = null,
  }) {
    return _then(_$DisconnectingImpl(
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DisconnectingImpl implements _Disconnecting {
  const _$DisconnectingImpl({required this.userUuid});

  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.disconnecting(userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisconnectingImpl &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      __$$DisconnectingImplCopyWithImpl<_$DisconnectingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return disconnecting(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return disconnecting?.call(userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return disconnecting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return disconnecting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (disconnecting != null) {
      return disconnecting(this);
    }
    return orElse();
  }
}

abstract class _Disconnecting implements HekaPlatformState {
  const factory _Disconnecting({required final String userUuid}) =
      _$DisconnectingImpl;

  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$DisconnectingImplCopyWith<_$DisconnectingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectedImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$ConnectedImplCopyWith(
          _$ConnectedImpl value, $Res Function(_$ConnectedImpl) then) =
      __$$ConnectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConnectedPlatform connection, String userUuid});

  $ConnectedPlatformCopyWith<$Res> get connection;
}

/// @nodoc
class __$$ConnectedImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$ConnectedImpl>
    implements _$$ConnectedImplCopyWith<$Res> {
  __$$ConnectedImplCopyWithImpl(
      _$ConnectedImpl _value, $Res Function(_$ConnectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connection = null,
    Object? userUuid = null,
  }) {
    return _then(_$ConnectedImpl(
      null == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as ConnectedPlatform,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectedPlatformCopyWith<$Res> get connection {
    return $ConnectedPlatformCopyWith<$Res>(_value.connection, (value) {
      return _then(_value.copyWith(connection: value));
    });
  }
}

/// @nodoc

class _$ConnectedImpl implements _Connected {
  const _$ConnectedImpl(this.connection, {required this.userUuid});

  @override
  final ConnectedPlatform connection;
  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.connected(connection: $connection, userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectedImpl &&
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
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      __$$ConnectedImplCopyWithImpl<_$ConnectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return connected(connection, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return connected?.call(connection, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(connection, userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _Connected implements HekaPlatformState {
  const factory _Connected(final ConnectedPlatform connection,
      {required final String userUuid}) = _$ConnectedImpl;

  ConnectedPlatform get connection;
  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$ConnectedImplCopyWith<_$ConnectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $HekaPlatformStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HekaHealthError error, String userUuid});

  $HekaHealthErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HekaPlatformStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? userUuid = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as HekaHealthError,
      userUuid: null == userUuid
          ? _value.userUuid
          : userUuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $HekaHealthErrorCopyWith<$Res> get error {
    return $HekaHealthErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error, {required this.userUuid});

  @override
  final HekaHealthError error;
  @override
  final String userUuid;

  @override
  String toString() {
    return 'HekaPlatformState.error(error: $error, userUuid: $userUuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.userUuid, userUuid) ||
                other.userUuid == userUuid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, userUuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userUuid) initial,
    required TResult Function(String userUuid) checkingConnection,
    required TResult Function(String userUuid) noConnection,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        tokenInvalidated,
    required TResult Function(String userUuid) makingConnection,
    required TResult Function(String userUuid) disconnecting,
    required TResult Function(ConnectedPlatform connection, String userUuid)
        connected,
    required TResult Function(HekaHealthError error, String userUuid) error,
  }) {
    return error(this.error, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userUuid)? initial,
    TResult? Function(String userUuid)? checkingConnection,
    TResult? Function(String userUuid)? noConnection,
    TResult? Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult? Function(String userUuid)? makingConnection,
    TResult? Function(String userUuid)? disconnecting,
    TResult? Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult? Function(HekaHealthError error, String userUuid)? error,
  }) {
    return error?.call(this.error, userUuid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userUuid)? initial,
    TResult Function(String userUuid)? checkingConnection,
    TResult Function(String userUuid)? noConnection,
    TResult Function(ConnectedPlatform connection, String userUuid)?
        tokenInvalidated,
    TResult Function(String userUuid)? makingConnection,
    TResult Function(String userUuid)? disconnecting,
    TResult Function(ConnectedPlatform connection, String userUuid)? connected,
    TResult Function(HekaHealthError error, String userUuid)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, userUuid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingConnection value) checkingConnection,
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_TokenInvalidated value) tokenInvalidated,
    required TResult Function(_MakingConnection value) makingConnection,
    required TResult Function(_Disconnecting value) disconnecting,
    required TResult Function(_Connected value) connected,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingConnection value)? checkingConnection,
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_TokenInvalidated value)? tokenInvalidated,
    TResult? Function(_MakingConnection value)? makingConnection,
    TResult? Function(_Disconnecting value)? disconnecting,
    TResult? Function(_Connected value)? connected,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingConnection value)? checkingConnection,
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_TokenInvalidated value)? tokenInvalidated,
    TResult Function(_MakingConnection value)? makingConnection,
    TResult Function(_Disconnecting value)? disconnecting,
    TResult Function(_Connected value)? connected,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HekaPlatformState {
  const factory _Error(final HekaHealthError error,
      {required final String userUuid}) = _$ErrorImpl;

  HekaHealthError get error;
  @override
  String get userUuid;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
