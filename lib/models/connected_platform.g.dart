// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_platform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectedPlatformImpl _$$ConnectedPlatformImplFromJson(
        Map<String, dynamic> json) =>
    _$ConnectedPlatformImpl(
      platform: json['platform_name'] as String,
      loggedIn: json['logged_in'] as bool,
      lastSync: json['last_sync'] == null
          ? null
          : DateTime.parse(json['last_sync'] as String),
      connectedDevicesUUIDs: (json['connected_device_uuids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ConnectedPlatformImplToJson(
        _$ConnectedPlatformImpl instance) =>
    <String, dynamic>{
      'platform_name': instance.platform,
      'logged_in': instance.loggedIn,
      'last_sync': instance.lastSync?.toIso8601String(),
      'connected_device_uuids': instance.connectedDevicesUUIDs,
    };
