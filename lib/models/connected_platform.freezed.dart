// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_platform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectedPlatform _$ConnectedPlatformFromJson(Map<String, dynamic> json) {
  return _ConnectedPlatform.fromJson(json);
}

/// @nodoc
mixin _$ConnectedPlatform {
  @JsonKey(name: 'platform_name')
  String get platform => throw _privateConstructorUsedError;
  @JsonKey(name: 'logged_in')
  bool get loggedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_sync')
  DateTime? get lastSync => throw _privateConstructorUsedError;
  @JsonKey(name: 'connected_device_uuids')
  List<String>? get connectedDevicesUUIDs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectedPlatformCopyWith<ConnectedPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedPlatformCopyWith<$Res> {
  factory $ConnectedPlatformCopyWith(
          ConnectedPlatform value, $Res Function(ConnectedPlatform) then) =
      _$ConnectedPlatformCopyWithImpl<$Res, ConnectedPlatform>;
  @useResult
  $Res call(
      {@JsonKey(name: 'platform_name')
          String platform,
      @JsonKey(name: 'logged_in')
          bool loggedIn,
      @JsonKey(name: 'last_sync')
          DateTime? lastSync,
      @JsonKey(name: 'connected_device_uuids')
          List<String>? connectedDevicesUUIDs});
}

/// @nodoc
class _$ConnectedPlatformCopyWithImpl<$Res, $Val extends ConnectedPlatform>
    implements $ConnectedPlatformCopyWith<$Res> {
  _$ConnectedPlatformCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? loggedIn = null,
    Object? lastSync = freezed,
    Object? connectedDevicesUUIDs = freezed,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      connectedDevicesUUIDs: freezed == connectedDevicesUUIDs
          ? _value.connectedDevicesUUIDs
          : connectedDevicesUUIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectedPlatformCopyWith<$Res>
    implements $ConnectedPlatformCopyWith<$Res> {
  factory _$$_ConnectedPlatformCopyWith(_$_ConnectedPlatform value,
          $Res Function(_$_ConnectedPlatform) then) =
      __$$_ConnectedPlatformCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'platform_name')
          String platform,
      @JsonKey(name: 'logged_in')
          bool loggedIn,
      @JsonKey(name: 'last_sync')
          DateTime? lastSync,
      @JsonKey(name: 'connected_device_uuids')
          List<String>? connectedDevicesUUIDs});
}

/// @nodoc
class __$$_ConnectedPlatformCopyWithImpl<$Res>
    extends _$ConnectedPlatformCopyWithImpl<$Res, _$_ConnectedPlatform>
    implements _$$_ConnectedPlatformCopyWith<$Res> {
  __$$_ConnectedPlatformCopyWithImpl(
      _$_ConnectedPlatform _value, $Res Function(_$_ConnectedPlatform) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? loggedIn = null,
    Object? lastSync = freezed,
    Object? connectedDevicesUUIDs = freezed,
  }) {
    return _then(_$_ConnectedPlatform(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      loggedIn: null == loggedIn
          ? _value.loggedIn
          : loggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      connectedDevicesUUIDs: freezed == connectedDevicesUUIDs
          ? _value._connectedDevicesUUIDs
          : connectedDevicesUUIDs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnectedPlatform extends _ConnectedPlatform {
  const _$_ConnectedPlatform(
      {@JsonKey(name: 'platform_name')
          required this.platform,
      @JsonKey(name: 'logged_in')
          required this.loggedIn,
      @JsonKey(name: 'last_sync')
          required this.lastSync,
      @JsonKey(name: 'connected_device_uuids')
          required final List<String>? connectedDevicesUUIDs})
      : _connectedDevicesUUIDs = connectedDevicesUUIDs,
        super._();

  factory _$_ConnectedPlatform.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectedPlatformFromJson(json);

  @override
  @JsonKey(name: 'platform_name')
  final String platform;
  @override
  @JsonKey(name: 'logged_in')
  final bool loggedIn;
  @override
  @JsonKey(name: 'last_sync')
  final DateTime? lastSync;
  final List<String>? _connectedDevicesUUIDs;
  @override
  @JsonKey(name: 'connected_device_uuids')
  List<String>? get connectedDevicesUUIDs {
    final value = _connectedDevicesUUIDs;
    if (value == null) return null;
    if (_connectedDevicesUUIDs is EqualUnmodifiableListView)
      return _connectedDevicesUUIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ConnectedPlatform(platform: $platform, loggedIn: $loggedIn, lastSync: $lastSync, connectedDevicesUUIDs: $connectedDevicesUUIDs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectedPlatform &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.loggedIn, loggedIn) ||
                other.loggedIn == loggedIn) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            const DeepCollectionEquality()
                .equals(other._connectedDevicesUUIDs, _connectedDevicesUUIDs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platform, loggedIn, lastSync,
      const DeepCollectionEquality().hash(_connectedDevicesUUIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectedPlatformCopyWith<_$_ConnectedPlatform> get copyWith =>
      __$$_ConnectedPlatformCopyWithImpl<_$_ConnectedPlatform>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectedPlatformToJson(
      this,
    );
  }
}

abstract class _ConnectedPlatform extends ConnectedPlatform {
  const factory _ConnectedPlatform(
          {@JsonKey(name: 'platform_name')
              required final String platform,
          @JsonKey(name: 'logged_in')
              required final bool loggedIn,
          @JsonKey(name: 'last_sync')
              required final DateTime? lastSync,
          @JsonKey(name: 'connected_device_uuids')
              required final List<String>? connectedDevicesUUIDs}) =
      _$_ConnectedPlatform;
  const _ConnectedPlatform._() : super._();

  factory _ConnectedPlatform.fromJson(Map<String, dynamic> json) =
      _$_ConnectedPlatform.fromJson;

  @override
  @JsonKey(name: 'platform_name')
  String get platform;
  @override
  @JsonKey(name: 'logged_in')
  bool get loggedIn;
  @override
  @JsonKey(name: 'last_sync')
  DateTime? get lastSync;
  @override
  @JsonKey(name: 'connected_device_uuids')
  List<String>? get connectedDevicesUUIDs;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectedPlatformCopyWith<_$_ConnectedPlatform> get copyWith =>
      throw _privateConstructorUsedError;
}
