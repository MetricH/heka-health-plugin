import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'heka_health_platform_interface.dart';

/// An implementation of [HekaHealthPlatform] that uses method channels.
class MethodChannelHekaHealth extends HekaHealthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('heka_health');

  @override
  Future<int> syncIosHealthData(String apiKey, String userUuid) async {
    final result = await methodChannel.invokeMethod<int>(
          'syncIosHealthData',
          {
            'apiKey': apiKey,
            'userUuid': userUuid,
          },
        ) ??
        0;
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
  Future<bool?> checkHealthKitPermissions() async {
    final result =
        (await methodChannel.invokeMethod<bool>('checkHealthKitPermissions')) ??
            false;
    return result;
  }

  @override
  Future<bool> disconnect() async {
    final result =
        (await methodChannel.invokeMethod<bool>('disconnect')) ?? false;
    return result;
  }
}
