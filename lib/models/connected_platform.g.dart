// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_platform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConnectedPlatform _$$_ConnectedPlatformFromJson(Map<String, dynamic> json) =>
    _$_ConnectedPlatform(
      platform: json['platform_name'] as String,
      loggedIn: json['loggedIn'] as bool,
      lastSync: json['lastSync'] as String,
    );

Map<String, dynamic> _$$_ConnectedPlatformToJson(
        _$_ConnectedPlatform instance) =>
    <String, dynamic>{
      'platform_name': instance.platform,
      'loggedIn': instance.loggedIn,
      'lastSync': instance.lastSync,
    };
