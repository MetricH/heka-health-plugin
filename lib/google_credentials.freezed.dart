// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleCredentials {
  String get refreshToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleCredentialsCopyWith<GoogleCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleCredentialsCopyWith<$Res> {
  factory $GoogleCredentialsCopyWith(
          GoogleCredentials value, $Res Function(GoogleCredentials) then) =
      _$GoogleCredentialsCopyWithImpl<$Res, GoogleCredentials>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$GoogleCredentialsCopyWithImpl<$Res, $Val extends GoogleCredentials>
    implements $GoogleCredentialsCopyWith<$Res> {
  _$GoogleCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleCredentialsCopyWith<$Res>
    implements $GoogleCredentialsCopyWith<$Res> {
  factory _$$_GoogleCredentialsCopyWith(_$_GoogleCredentials value,
          $Res Function(_$_GoogleCredentials) then) =
      __$$_GoogleCredentialsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$_GoogleCredentialsCopyWithImpl<$Res>
    extends _$GoogleCredentialsCopyWithImpl<$Res, _$_GoogleCredentials>
    implements _$$_GoogleCredentialsCopyWith<$Res> {
  __$$_GoogleCredentialsCopyWithImpl(
      _$_GoogleCredentials _value, $Res Function(_$_GoogleCredentials) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$_GoogleCredentials(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoogleCredentials extends _GoogleCredentials {
  const _$_GoogleCredentials({required this.refreshToken}) : super._();

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'GoogleCredentials(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GoogleCredentials &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleCredentialsCopyWith<_$_GoogleCredentials> get copyWith =>
      __$$_GoogleCredentialsCopyWithImpl<_$_GoogleCredentials>(
          this, _$identity);
}

abstract class _GoogleCredentials extends GoogleCredentials {
  const factory _GoogleCredentials({required final String refreshToken}) =
      _$_GoogleCredentials;
  const _GoogleCredentials._() : super._();

  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_GoogleCredentialsCopyWith<_$_GoogleCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}
