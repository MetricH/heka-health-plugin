// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Connection _$$_ConnectionFromJson(Map<String, dynamic> json) =>
    _$_Connection(
      userUuid: json['uuid'] as String,
      connections: (json['connections'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            e == null
                ? null
                : ConnectedPlatform.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_ConnectionToJson(_$_Connection instance) =>
    <String, dynamic>{
      'uuid': instance.userUuid,
      'connections': instance.connections,
    };
