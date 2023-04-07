// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enabled_platform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnabledPlatform _$EnabledPlatformFromJson(Map<String, dynamic> json) {
  return _EnabledPlatform.fromJson(json);
}

/// @nodoc
mixin _$EnabledPlatform {
  @JsonKey(name: 'platform_name')
  String get platformName => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_app_id')
  String? get platformAppId => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_app_secret')
  String? get platformAppSecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'enabled_scopes')
  List<String>? get enabledScopes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnabledPlatformCopyWith<EnabledPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnabledPlatformCopyWith<$Res> {
  factory $EnabledPlatformCopyWith(
          EnabledPlatform value, $Res Function(EnabledPlatform) then) =
      _$EnabledPlatformCopyWithImpl<$Res, EnabledPlatform>;
  @useResult
  $Res call(
      {@JsonKey(name: 'platform_name') String platformName,
      @JsonKey(name: 'platform_app_id') String? platformAppId,
      @JsonKey(name: 'platform_app_secret') String? platformAppSecret,
      @JsonKey(name: 'enabled_scopes') List<String>? enabledScopes});
}

/// @nodoc
class _$EnabledPlatformCopyWithImpl<$Res, $Val extends EnabledPlatform>
    implements $EnabledPlatformCopyWith<$Res> {
  _$EnabledPlatformCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformName = null,
    Object? platformAppId = freezed,
    Object? platformAppSecret = freezed,
    Object? enabledScopes = freezed,
  }) {
    return _then(_value.copyWith(
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      platformAppId: freezed == platformAppId
          ? _value.platformAppId
          : platformAppId // ignore: cast_nullable_to_non_nullable
              as String?,
      platformAppSecret: freezed == platformAppSecret
          ? _value.platformAppSecret
          : platformAppSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      enabledScopes: freezed == enabledScopes
          ? _value.enabledScopes
          : enabledScopes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnabledPlatformCopyWith<$Res>
    implements $EnabledPlatformCopyWith<$Res> {
  factory _$$_EnabledPlatformCopyWith(
          _$_EnabledPlatform value, $Res Function(_$_EnabledPlatform) then) =
      __$$_EnabledPlatformCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'platform_name') String platformName,
      @JsonKey(name: 'platform_app_id') String? platformAppId,
      @JsonKey(name: 'platform_app_secret') String? platformAppSecret,
      @JsonKey(name: 'enabled_scopes') List<String>? enabledScopes});
}

/// @nodoc
class __$$_EnabledPlatformCopyWithImpl<$Res>
    extends _$EnabledPlatformCopyWithImpl<$Res, _$_EnabledPlatform>
    implements _$$_EnabledPlatformCopyWith<$Res> {
  __$$_EnabledPlatformCopyWithImpl(
      _$_EnabledPlatform _value, $Res Function(_$_EnabledPlatform) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformName = null,
    Object? platformAppId = freezed,
    Object? platformAppSecret = freezed,
    Object? enabledScopes = freezed,
  }) {
    return _then(_$_EnabledPlatform(
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      platformAppId: freezed == platformAppId
          ? _value.platformAppId
          : platformAppId // ignore: cast_nullable_to_non_nullable
              as String?,
      platformAppSecret: freezed == platformAppSecret
          ? _value.platformAppSecret
          : platformAppSecret // ignore: cast_nullable_to_non_nullable
              as String?,
      enabledScopes: freezed == enabledScopes
          ? _value._enabledScopes
          : enabledScopes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EnabledPlatform implements _EnabledPlatform {
  const _$_EnabledPlatform(
      {@JsonKey(name: 'platform_name')
          required this.platformName,
      @JsonKey(name: 'platform_app_id')
          required this.platformAppId,
      @JsonKey(name: 'platform_app_secret')
          required this.platformAppSecret,
      @JsonKey(name: 'enabled_scopes')
          required final List<String>? enabledScopes})
      : _enabledScopes = enabledScopes;

  factory _$_EnabledPlatform.fromJson(Map<String, dynamic> json) =>
      _$$_EnabledPlatformFromJson(json);

  @override
  @JsonKey(name: 'platform_name')
  final String platformName;
  @override
  @JsonKey(name: 'platform_app_id')
  final String? platformAppId;
  @override
  @JsonKey(name: 'platform_app_secret')
  final String? platformAppSecret;
  final List<String>? _enabledScopes;
  @override
  @JsonKey(name: 'enabled_scopes')
  List<String>? get enabledScopes {
    final value = _enabledScopes;
    if (value == null) return null;
    if (_enabledScopes is EqualUnmodifiableListView) return _enabledScopes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EnabledPlatform(platformName: $platformName, platformAppId: $platformAppId, platformAppSecret: $platformAppSecret, enabledScopes: $enabledScopes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnabledPlatform &&
            (identical(other.platformName, platformName) ||
                other.platformName == platformName) &&
            (identical(other.platformAppId, platformAppId) ||
                other.platformAppId == platformAppId) &&
            (identical(other.platformAppSecret, platformAppSecret) ||
                other.platformAppSecret == platformAppSecret) &&
            const DeepCollectionEquality()
                .equals(other._enabledScopes, _enabledScopes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platformName, platformAppId,
      platformAppSecret, const DeepCollectionEquality().hash(_enabledScopes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnabledPlatformCopyWith<_$_EnabledPlatform> get copyWith =>
      __$$_EnabledPlatformCopyWithImpl<_$_EnabledPlatform>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnabledPlatformToJson(
      this,
    );
  }
}

abstract class _EnabledPlatform implements EnabledPlatform {
  const factory _EnabledPlatform(
      {@JsonKey(name: 'platform_name')
          required final String platformName,
      @JsonKey(name: 'platform_app_id')
          required final String? platformAppId,
      @JsonKey(name: 'platform_app_secret')
          required final String? platformAppSecret,
      @JsonKey(name: 'enabled_scopes')
          required final List<String>? enabledScopes}) = _$_EnabledPlatform;

  factory _EnabledPlatform.fromJson(Map<String, dynamic> json) =
      _$_EnabledPlatform.fromJson;

  @override
  @JsonKey(name: 'platform_name')
  String get platformName;
  @override
  @JsonKey(name: 'platform_app_id')
  String? get platformAppId;
  @override
  @JsonKey(name: 'platform_app_secret')
  String? get platformAppSecret;
  @override
  @JsonKey(name: 'enabled_scopes')
  List<String>? get enabledScopes;
  @override
  @JsonKey(ignore: true)
  _$$_EnabledPlatformCopyWith<_$_EnabledPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}
