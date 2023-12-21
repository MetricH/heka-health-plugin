import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'heka_health_platform_interface.dart';

/// An implementation of [HekaHealthPlatform] that uses method channels.
class MethodChannelHekaHealth extends HekaHealthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('heka_health');

  @override
  Future<bool> connect() async {
    if (Platform.isAndroid) {
      return requestGoogleAuth();
    } else {
      return requestHealthKitPermissions();
    }
  }

  @override
  Future<bool> syncIosHealthData(
      String apiKey, String userUuid, DateTime? lastSyncDate) async {
    final result = await methodChannel.invokeMethod<bool>(
          'syncIosHealthData',
          {
            'apiKey': apiKey,
            'userUuid': userUuid,
            'lastSyncDate': lastSyncDate?.toIso8601String(),
          },
        ) ??
        false;
    return result;
  }

  @override
  Future<bool> requestGoogleAuth() async {
    final result =
        (await methodChannel.invokeMethod<bool>('requestAuthorization')) ??
            false;
    return result;
  }

  @override
  Future<bool> requestHealthKitPermissions() async {
    final result =
        (await methodChannel.invokeMethod<bool>('requestAuthorization')) ??
            false;
    return result;
  }

  @override
  Future<Map<DateTime, double>> getDateWiseData(
    String dataType,
    DateTime startDate,
    DateTime endDate,
  ) async {
    if (Platform.isIOS) {
      final result = (await methodChannel.invokeMethod<List?>(
        'getDateWiseData',
        {
          'dataType': dataType,
          'startTime': startDate.toIso8601String(),
          'endTime': endDate.toIso8601String(),
        },
      ));
      if (result == null) {
        return {};
      }
      Map<DateTime, double> data = {};
      print(result);
      for (Map item in result) {
        double value = item['value'].toDouble();
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch((item['date'] as int));
        data[date] = value;
      }
      return data;
    } else {
      final result = (await methodChannel.invokeMethod<Map?>(
        'getDateWiseData',
        {
          'dataType': dataType,
          'startTime': startDate.millisecondsSinceEpoch,
          'endTime': endDate.millisecondsSinceEpoch,
        },
      ));
      if (result == null) {
        return {};
      }
      Map<DateTime, double> data = {};
      for (var item in result.entries) {
        data[DateTime.fromMillisecondsSinceEpoch(item.key)] =
            item.value.toDouble();
      }
      return data;
    }
  }

  @override
  Future<double?> getAggregatedValueForDataType(
    String dataType,
    DateTime startDate,
    DateTime endDate,
  ) async {
    if (Platform.isIOS) {
      final result = (await methodChannel.invokeMethod<double?>(
        'getAggregatedValueForDataType',
        {
          'dataType': dataType,
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      ));
      return result;
    } else {
      return null;
    }
  }

  @override
  Future<List<Object?>> getMenstrualData(
      DateTime startDate, DateTime endDate) async {
    final result = (await methodChannel.invokeMethod<List<Object?>>(
      'getMenstrualData',
      {
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      },
    ));
    return result ?? [];
  }

  @override
  Future<bool> disconnect() async {
    bool result;
    if (Platform.isAndroid) {
      result = (await methodChannel.invokeMethod<bool>('revokePermissions')) ??
          false;
    } else {
      result = (await methodChannel.invokeMethod<bool>('disconnect')) ?? false;
    }

    return result;
  }
}
