// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enabled_platform.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EnabledPlatform _$$_EnabledPlatformFromJson(Map<String, dynamic> json) =>
    _$_EnabledPlatform(
      platformName: json['platform_name'] as String,
      platformAppId: json['platform_app_id'] as String?,
      platformAppSecret: json['platform_app_secret'] as String?,
    );

Map<String, dynamic> _$$_EnabledPlatformToJson(_$_EnabledPlatform instance) =>
    <String, dynamic>{
      'platform_name': instance.platformName,
      'platform_app_id': instance.platformAppId,
      'platform_app_secret': instance.platformAppSecret,
    };
