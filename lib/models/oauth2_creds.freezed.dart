// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth2_creds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OAuth2Creds {
  String get refreshToken => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OAuth2CredsCopyWith<OAuth2Creds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuth2CredsCopyWith<$Res> {
  factory $OAuth2CredsCopyWith(
          OAuth2Creds value, $Res Function(OAuth2Creds) then) =
      _$OAuth2CredsCopyWithImpl<$Res, OAuth2Creds>;
  @useResult
  $Res call({String refreshToken, String? email});
}

/// @nodoc
class _$OAuth2CredsCopyWithImpl<$Res, $Val extends OAuth2Creds>
    implements $OAuth2CredsCopyWith<$Res> {
  _$OAuth2CredsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OAuth2CredsImplCopyWith<$Res>
    implements $OAuth2CredsCopyWith<$Res> {
  factory _$$OAuth2CredsImplCopyWith(
          _$OAuth2CredsImpl value, $Res Function(_$OAuth2CredsImpl) then) =
      __$$OAuth2CredsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken, String? email});
}

/// @nodoc
class __$$OAuth2CredsImplCopyWithImpl<$Res>
    extends _$OAuth2CredsCopyWithImpl<$Res, _$OAuth2CredsImpl>
    implements _$$OAuth2CredsImplCopyWith<$Res> {
  __$$OAuth2CredsImplCopyWithImpl(
      _$OAuth2CredsImpl _value, $Res Function(_$OAuth2CredsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
    Object? email = freezed,
  }) {
    return _then(_$OAuth2CredsImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OAuth2CredsImpl extends _OAuth2Creds {
  const _$OAuth2CredsImpl({required this.refreshToken, required this.email})
      : super._();

  @override
  final String refreshToken;
  @override
  final String? email;

  @override
  String toString() {
    return 'OAuth2Creds(refreshToken: $refreshToken, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuth2CredsImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refreshToken, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuth2CredsImplCopyWith<_$OAuth2CredsImpl> get copyWith =>
      __$$OAuth2CredsImplCopyWithImpl<_$OAuth2CredsImpl>(this, _$identity);
}

abstract class _OAuth2Creds extends OAuth2Creds {
  const factory _OAuth2Creds(
      {required final String refreshToken,
      required final String? email}) = _$OAuth2CredsImpl;
  const _OAuth2Creds._() : super._();

  @override
  String get refreshToken;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$OAuth2CredsImplCopyWith<_$OAuth2CredsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
