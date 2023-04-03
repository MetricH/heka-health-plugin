// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserApp _$UserAppFromJson(Map<String, dynamic> json) {
  return _UserApp.fromJson(json);
}

/// @nodoc
mixin _$UserApp {
  @JsonKey(name: 'enabled_platforms')
  List<EnabledPlatform> get enabledPlatforms =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_plan')
  String get paymentPlan => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAppCopyWith<UserApp> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAppCopyWith<$Res> {
  factory $UserAppCopyWith(UserApp value, $Res Function(UserApp) then) =
      _$UserAppCopyWithImpl<$Res, UserApp>;
  @useResult
  $Res call(
      {@JsonKey(name: 'enabled_platforms')
          List<EnabledPlatform> enabledPlatforms,
      @JsonKey(name: 'payment_plan')
          String paymentPlan});
}

/// @nodoc
class _$UserAppCopyWithImpl<$Res, $Val extends UserApp>
    implements $UserAppCopyWith<$Res> {
  _$UserAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabledPlatforms = null,
    Object? paymentPlan = null,
  }) {
    return _then(_value.copyWith(
      enabledPlatforms: null == enabledPlatforms
          ? _value.enabledPlatforms
          : enabledPlatforms // ignore: cast_nullable_to_non_nullable
              as List<EnabledPlatform>,
      paymentPlan: null == paymentPlan
          ? _value.paymentPlan
          : paymentPlan // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserAppCopyWith<$Res> implements $UserAppCopyWith<$Res> {
  factory _$$_UserAppCopyWith(
          _$_UserApp value, $Res Function(_$_UserApp) then) =
      __$$_UserAppCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'enabled_platforms')
          List<EnabledPlatform> enabledPlatforms,
      @JsonKey(name: 'payment_plan')
          String paymentPlan});
}

/// @nodoc
class __$$_UserAppCopyWithImpl<$Res>
    extends _$UserAppCopyWithImpl<$Res, _$_UserApp>
    implements _$$_UserAppCopyWith<$Res> {
  __$$_UserAppCopyWithImpl(_$_UserApp _value, $Res Function(_$_UserApp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabledPlatforms = null,
    Object? paymentPlan = null,
  }) {
    return _then(_$_UserApp(
      enabledPlatforms: null == enabledPlatforms
          ? _value._enabledPlatforms
          : enabledPlatforms // ignore: cast_nullable_to_non_nullable
              as List<EnabledPlatform>,
      paymentPlan: null == paymentPlan
          ? _value.paymentPlan
          : paymentPlan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserApp extends _UserApp {
  _$_UserApp(
      {@JsonKey(name: 'enabled_platforms')
          required final List<EnabledPlatform> enabledPlatforms,
      @JsonKey(name: 'payment_plan')
          required this.paymentPlan})
      : _enabledPlatforms = enabledPlatforms,
        super._();

  factory _$_UserApp.fromJson(Map<String, dynamic> json) =>
      _$$_UserAppFromJson(json);

  final List<EnabledPlatform> _enabledPlatforms;
  @override
  @JsonKey(name: 'enabled_platforms')
  List<EnabledPlatform> get enabledPlatforms {
    if (_enabledPlatforms is EqualUnmodifiableListView)
      return _enabledPlatforms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enabledPlatforms);
  }

  @override
  @JsonKey(name: 'payment_plan')
  final String paymentPlan;

  @override
  String toString() {
    return 'UserApp(enabledPlatforms: $enabledPlatforms, paymentPlan: $paymentPlan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserApp &&
            const DeepCollectionEquality()
                .equals(other._enabledPlatforms, _enabledPlatforms) &&
            (identical(other.paymentPlan, paymentPlan) ||
                other.paymentPlan == paymentPlan));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_enabledPlatforms), paymentPlan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserAppCopyWith<_$_UserApp> get copyWith =>
      __$$_UserAppCopyWithImpl<_$_UserApp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAppToJson(
      this,
    );
  }
}

abstract class _UserApp extends UserApp {
  factory _UserApp(
      {@JsonKey(name: 'enabled_platforms')
          required final List<EnabledPlatform> enabledPlatforms,
      @JsonKey(name: 'payment_plan')
          required final String paymentPlan}) = _$_UserApp;
  _UserApp._() : super._();

  factory _UserApp.fromJson(Map<String, dynamic> json) = _$_UserApp.fromJson;

  @override
  @JsonKey(name: 'enabled_platforms')
  List<EnabledPlatform> get enabledPlatforms;
  @override
  @JsonKey(name: 'payment_plan')
  String get paymentPlan;
  @override
  @JsonKey(ignore: true)
  _$$_UserAppCopyWith<_$_UserApp> get copyWith =>
      throw _privateConstructorUsedError;
}
