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
    required TResult Function(String message) preConnectError,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? preConnectError,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? preConnectError,
    TResult Function(String message)? appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_GoogleClientIdNotRegistered value)
        googleClientIdNotRegistered,
    required TResult Function(_PreConnectError value) preConnectError,
    required TResult Function(_AppleHealthkitPermissionsDenied value)
        appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult? Function(_PreConnectError value)? preConnectError,
    TResult? Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult Function(_PreConnectError value)? preConnectError,
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
abstract class _$$NoConnectionImplCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$NoConnectionImplCopyWith(
          _$NoConnectionImpl value, $Res Function(_$NoConnectionImpl) then) =
      __$$NoConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoConnectionImplCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res, _$NoConnectionImpl>
    implements _$$NoConnectionImplCopyWith<$Res> {
  __$$NoConnectionImplCopyWithImpl(
      _$NoConnectionImpl _value, $Res Function(_$NoConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoConnectionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoConnectionImpl extends _NoConnection {
  const _$NoConnectionImpl({this.message = 'Something went wrong!'})
      : super._();

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
            other is _$NoConnectionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoConnectionImplCopyWith<_$NoConnectionImpl> get copyWith =>
      __$$NoConnectionImplCopyWithImpl<_$NoConnectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) preConnectError,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return noConnection(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? preConnectError,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return noConnection?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? preConnectError,
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
    required TResult Function(_PreConnectError value) preConnectError,
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
    TResult? Function(_PreConnectError value)? preConnectError,
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
    TResult Function(_PreConnectError value)? preConnectError,
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
  const factory _NoConnection({final String message}) = _$NoConnectionImpl;
  const _NoConnection._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$NoConnectionImplCopyWith<_$NoConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleClientIdNotRegisteredImplCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$GoogleClientIdNotRegisteredImplCopyWith(
          _$GoogleClientIdNotRegisteredImpl value,
          $Res Function(_$GoogleClientIdNotRegisteredImpl) then) =
      __$$GoogleClientIdNotRegisteredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GoogleClientIdNotRegisteredImplCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res,
        _$GoogleClientIdNotRegisteredImpl>
    implements _$$GoogleClientIdNotRegisteredImplCopyWith<$Res> {
  __$$GoogleClientIdNotRegisteredImplCopyWithImpl(
      _$GoogleClientIdNotRegisteredImpl _value,
      $Res Function(_$GoogleClientIdNotRegisteredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GoogleClientIdNotRegisteredImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleClientIdNotRegisteredImpl extends _GoogleClientIdNotRegistered {
  const _$GoogleClientIdNotRegisteredImpl(
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
            other is _$GoogleClientIdNotRegisteredImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleClientIdNotRegisteredImplCopyWith<_$GoogleClientIdNotRegisteredImpl>
      get copyWith => __$$GoogleClientIdNotRegisteredImplCopyWithImpl<
          _$GoogleClientIdNotRegisteredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) preConnectError,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return googleClientIdNotRegistered(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? preConnectError,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return googleClientIdNotRegistered?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? preConnectError,
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
    required TResult Function(_PreConnectError value) preConnectError,
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
    TResult? Function(_PreConnectError value)? preConnectError,
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
    TResult Function(_PreConnectError value)? preConnectError,
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
      _$GoogleClientIdNotRegisteredImpl;
  const _GoogleClientIdNotRegistered._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$GoogleClientIdNotRegisteredImplCopyWith<_$GoogleClientIdNotRegisteredImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreConnectErrorImplCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$PreConnectErrorImplCopyWith(_$PreConnectErrorImpl value,
          $Res Function(_$PreConnectErrorImpl) then) =
      __$$PreConnectErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PreConnectErrorImplCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res, _$PreConnectErrorImpl>
    implements _$$PreConnectErrorImplCopyWith<$Res> {
  __$$PreConnectErrorImplCopyWithImpl(
      _$PreConnectErrorImpl _value, $Res Function(_$PreConnectErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PreConnectErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PreConnectErrorImpl extends _PreConnectError {
  const _$PreConnectErrorImpl(
      {this.message = 'Something went wrong! Grant all requested permissions.'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'HekaHealthError.preConnectError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreConnectErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreConnectErrorImplCopyWith<_$PreConnectErrorImpl> get copyWith =>
      __$$PreConnectErrorImplCopyWithImpl<_$PreConnectErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) preConnectError,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return preConnectError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? preConnectError,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return preConnectError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? preConnectError,
    TResult Function(String message)? appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (preConnectError != null) {
      return preConnectError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoConnection value) noConnection,
    required TResult Function(_GoogleClientIdNotRegistered value)
        googleClientIdNotRegistered,
    required TResult Function(_PreConnectError value) preConnectError,
    required TResult Function(_AppleHealthkitPermissionsDenied value)
        appleHealthkitPermissionsDenied,
  }) {
    return preConnectError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoConnection value)? noConnection,
    TResult? Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult? Function(_PreConnectError value)? preConnectError,
    TResult? Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
  }) {
    return preConnectError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoConnection value)? noConnection,
    TResult Function(_GoogleClientIdNotRegistered value)?
        googleClientIdNotRegistered,
    TResult Function(_PreConnectError value)? preConnectError,
    TResult Function(_AppleHealthkitPermissionsDenied value)?
        appleHealthkitPermissionsDenied,
    required TResult orElse(),
  }) {
    if (preConnectError != null) {
      return preConnectError(this);
    }
    return orElse();
  }
}

abstract class _PreConnectError extends HekaHealthError {
  const factory _PreConnectError({final String message}) =
      _$PreConnectErrorImpl;
  const _PreConnectError._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$PreConnectErrorImplCopyWith<_$PreConnectErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppleHealthkitPermissionsDeniedImplCopyWith<$Res>
    implements $HekaHealthErrorCopyWith<$Res> {
  factory _$$AppleHealthkitPermissionsDeniedImplCopyWith(
          _$AppleHealthkitPermissionsDeniedImpl value,
          $Res Function(_$AppleHealthkitPermissionsDeniedImpl) then) =
      __$$AppleHealthkitPermissionsDeniedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AppleHealthkitPermissionsDeniedImplCopyWithImpl<$Res>
    extends _$HekaHealthErrorCopyWithImpl<$Res,
        _$AppleHealthkitPermissionsDeniedImpl>
    implements _$$AppleHealthkitPermissionsDeniedImplCopyWith<$Res> {
  __$$AppleHealthkitPermissionsDeniedImplCopyWithImpl(
      _$AppleHealthkitPermissionsDeniedImpl _value,
      $Res Function(_$AppleHealthkitPermissionsDeniedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AppleHealthkitPermissionsDeniedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppleHealthkitPermissionsDeniedImpl
    extends _AppleHealthkitPermissionsDenied {
  const _$AppleHealthkitPermissionsDeniedImpl(
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
            other is _$AppleHealthkitPermissionsDeniedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleHealthkitPermissionsDeniedImplCopyWith<
          _$AppleHealthkitPermissionsDeniedImpl>
      get copyWith => __$$AppleHealthkitPermissionsDeniedImplCopyWithImpl<
          _$AppleHealthkitPermissionsDeniedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) noConnection,
    required TResult Function(String message) googleClientIdNotRegistered,
    required TResult Function(String message) preConnectError,
    required TResult Function(String message) appleHealthkitPermissionsDenied,
  }) {
    return appleHealthkitPermissionsDenied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? noConnection,
    TResult? Function(String message)? googleClientIdNotRegistered,
    TResult? Function(String message)? preConnectError,
    TResult? Function(String message)? appleHealthkitPermissionsDenied,
  }) {
    return appleHealthkitPermissionsDenied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? noConnection,
    TResult Function(String message)? googleClientIdNotRegistered,
    TResult Function(String message)? preConnectError,
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
    required TResult Function(_PreConnectError value) preConnectError,
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
    TResult? Function(_PreConnectError value)? preConnectError,
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
    TResult Function(_PreConnectError value)? preConnectError,
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
      _$AppleHealthkitPermissionsDeniedImpl;
  const _AppleHealthkitPermissionsDenied._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AppleHealthkitPermissionsDeniedImplCopyWith<
          _$AppleHealthkitPermissionsDeniedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
