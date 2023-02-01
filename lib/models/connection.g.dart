// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Connection _$$_ConnectionFromJson(Map<String, dynamic> json) =>
    _$_Connection(
      id: json['id'] as int,
      userUuid: json['user_uuid'] as String,
      platform: json['platform'] as String,
      googleFitRefreshToken: json['google_fit_refresh_token'] as String?,
      app: json['app'] as int,
      loggedIn: json['logged_in'] as bool,
      lastSync: json['last_sync'] as String?,
    );

Map<String, dynamic> _$$_ConnectionToJson(_$_Connection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_uuid': instance.userUuid,
      'platform': instance.platform,
      'google_fit_refresh_token': instance.googleFitRefreshToken,
      'app': instance.app,
      'logged_in': instance.loggedIn,
      'last_sync': instance.lastSync,
    };
