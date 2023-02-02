// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Connection _$$_ConnectionFromJson(Map<String, dynamic> json) =>
    _$_Connection(
      id: json['id'] as int,
      userUuid: json['user_uuid'] as String,
      googleFitRefreshToken: json['google_fit_refresh_token'] as String?,
      app: json['app'] as int,
      connectedPlatforms: (json['connected_platforms'] as List<dynamic>)
          .map((e) => ConnectedPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ConnectionToJson(_$_Connection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_uuid': instance.userUuid,
      'google_fit_refresh_token': instance.googleFitRefreshToken,
      'app': instance.app,
      'connected_platforms': instance.connectedPlatforms,
    };
