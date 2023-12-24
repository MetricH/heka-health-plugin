// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAppImpl _$$UserAppImplFromJson(Map<String, dynamic> json) =>
    _$UserAppImpl(
      enabledPlatforms: (json['enabled_platforms'] as List<dynamic>)
          .map((e) => EnabledPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentPlan: json['payment_plan'] as String,
    );

Map<String, dynamic> _$$UserAppImplToJson(_$UserAppImpl instance) =>
    <String, dynamic>{
      'enabled_platforms':
          instance.enabledPlatforms.map((e) => e.toJson()).toList(),
      'payment_plan': instance.paymentPlan,
    };
