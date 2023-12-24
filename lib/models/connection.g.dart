// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionImpl _$$ConnectionImplFromJson(Map<String, dynamic> json) =>
    _$ConnectionImpl(
      userUuid: json['user_uuid'] as String,
      connections: (json['connections'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : ConnectedPlatform.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$ConnectionImplToJson(_$ConnectionImpl instance) =>
    <String, dynamic>{
      'user_uuid': instance.userUuid,
      'connections':
          instance.connections.map((k, e) => MapEntry(k, e?.toJson())),
    };
