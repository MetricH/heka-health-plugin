// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heka_health_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HekaHealthError {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_GoogleClientIdNotRegistered value)
        googleClientIdNotRegistered,
    required TResult Function(_AppleHealthkitPermissionsDenied value)
        appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult? Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HekaHealthErrorCopyWith<HekaHealthError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HekaHealthErrorCopyWith<$Res> {
  factory $HekaHealthErrorCopyWith(
          HekaHealthError value, $Res Function(HekaHealthError) then) =
      _$HekaHealthErrorCopyWithImpl<$Res, HekaHealthError>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HekaHealthErrorCopyWithImpl<$Res, $Val extends HekaHealthError>
    implements $HekaHealthErrorCopyWith<$Res> {
  _$HekaHealthErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoConnectionCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$_NoConnectionCopyWith(
          _$_NoConnection value, $Res Function(_$_NoConnection) then) =
      __$$_NoConnectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_NoConnectionCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res, _$_NoConnection>
    implements _$$_NoConnectionCopyWith<$Res> {
  __$$_NoConnectionCopyWithImpl(
      _$_NoConnection _value, $Res Function(_$_NoConnection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_NoConnection(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NoConnection extends _NoConnection {
  const _$_NoConnection({this.message = 'Something went wrong!'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'HekaHealthError.noConnection(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoConnection &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoConnectionCopyWith<_$_NoConnection> get copyWith =>
      __$$_NoConnectionCopyWithImpl<_$_NoConnection>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return noConnection(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return noConnection?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_GoogleClientIdNotRegistered value)
        googleClientIdNotRegistered,
    required TResult Function(_AppleHealthkitPermissionsDenied value)
        appleHealthkitPermissionsDenied,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult? Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection extends HekaHealthError {
  const factory _NoConnection({final String message}) = _$_NoConnection;
  const _NoConnection._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_NoConnectionCopyWith<_$_NoConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GoogleClientIdNotRegisteredCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$_GoogleClientIdNotRegisteredCopyWith(
          _$_GoogleClientIdNotRegistered value,
          $Res Function(_$_GoogleClientIdNotRegistered) then) =
      __$$_GoogleClientIdNotRegisteredCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_GoogleClientIdNotRegisteredCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res, _$_GoogleClientIdNotRegistered>
    implements _$$_GoogleClientIdNotRegisteredCopyWith<$Res> {
  __$$_GoogleClientIdNotRegisteredCopyWithImpl(
      _$_GoogleClientIdNotRegistered _value,
      $Res Function(_$_GoogleClientIdNotRegistered) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_GoogleClientIdNotRegistered(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoogleClientIdNotRegistered extends _GoogleClientIdNotRegistered {
  const _$_GoogleClientIdNotRegistered(
      {this.message = 'Google Client ID not registered!'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'HekaHealthError.googleClientIdNotRegistered(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleClientIdNotRegistered &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleClientIdNotRegisteredCopyWith<_$_GoogleClientIdNotRegistered>
      get copyWith => __$$_GoogleClientIdNotRegisteredCopyWithImpl<
          _$_GoogleClientIdNotRegistered>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return googleClientIdNotRegistered(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return googleClientIdNotRegistered?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (googleClientIdNotRegistered != null) {
      return googleClientIdNotRegistered(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_GoogleClientIdNotRegistered value)
        googleClientIdNotRegistered,
    required TResult Function(_AppleHealthkitPermissionsDenied value)
        appleHealthkitPermissionsDenied,
  }) {
    return googleClientIdNotRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult? Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
  }) {
    return googleClientIdNotRegistered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (googleClientIdNotRegistered != null) {
      return googleClientIdNotRegistered(this);
    }
    return orElse();
  }
}

abstract class _GoogleClientIdNotRegistered extends HekaHealthError {
  const factory _GoogleClientIdNotRegistered({final String message}) =
      _$_GoogleClientIdNotRegistered;
  const _GoogleClientIdNotRegistered._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleClientIdNotRegisteredCopyWith<_$_GoogleClientIdNotRegistered>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppleHealthkitPermissionsDeniedCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$_AppleHealthkitPermissionsDeniedCopyWith(
          _$_AppleHealthkitPermissionsDenied value,
          $Res Function(_$_AppleHealthkitPermissionsDenied) then) =
      __$$_AppleHealthkitPermissionsDeniedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_AppleHealthkitPermissionsDeniedCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res,
        _$_AppleHealthkitPermissionsDenied>
    implements _$$_AppleHealthkitPermissionsDeniedCopyWith<$Res> {
  __$$_AppleHealthkitPermissionsDeniedCopyWithImpl(
      _$_AppleHealthkitPermissionsDenied _value,
      $Res Function(_$_AppleHealthkitPermissionsDenied) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AppleHealthkitPermissionsDenied(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppleHealthkitPermissionsDenied
    extends _AppleHealthkitPermissionsDenied {
  const _$_AppleHealthkitPermissionsDenied(
      {this.message = 'Apple Healthkit permissions denied!'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'HekaHealthError.appleHealthkitPermissionsDenied(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppleHealthkitPermissionsDenied &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppleHealthkitPermissionsDeniedCopyWith<
          _$_AppleHealthkitPermissionsDenied>
      get copyWith => __$$_AppleHealthkitPermissionsDeniedCopyWithImpl<
          _$_AppleHealthkitPermissionsDenied>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return appleHealthkitPermissionsDenied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return appleHealthkitPermissionsDenied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (appleHealthkitPermissionsDenied != null) {
      return appleHealthkitPermissionsDenied(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_GoogleClientIdNotRegistered value)
        googleClientIdNotRegistered,
    required TResult Function(_AppleHealthkitPermissionsDenied value)
        appleHealthkitPermissionsDenied,
  }) {
    return appleHealthkitPermissionsDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult? Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
  }) {
    return appleHealthkitPermissionsDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (appleHealthkitPermissionsDenied != null) {
      return appleHealthkitPermissionsDenied(this);
    }
    return orElse();
  }
}

abstract class _AppleHealthkitPermissionsDenied extends HekaHealthError {
  const factory _AppleHealthkitPermissionsDenied({final String message}) =
      _$_AppleHealthkitPermissionsDenied;
  const _AppleHealthkitPermissionsDenied._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_AppleHealthkitPermissionsDeniedCopyWith<
          _$_AppleHealthkitPermissionsDenied>
      get copyWith => throw _privateConstructorUsedError;
}
