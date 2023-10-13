import 'package:heka_health/repository/heka_health_platform_interface.dart';

class HekaHealthKit {
  static Future<bool> disconnectHealthKit() async =>
      HekaHealthPlatform.instance.disconnect();

  static Future<bool> syncIosHealthData({
    required String apiKey,
    required String userUuid,
    required DateTime? lastSyncTime,
  }) async =>
      HekaHealthPlatform.instance.syncIosHealthData(
        apiKey,
        userUuid,
        lastSyncTime,
      );

  static Future<double?> getAggregatedData(
          {required String dataType,
          required DateTime startDate,
          required DateTime endDate}) =>
      HekaHealthPlatform.instance
          .getAggregatedValueForDataType(dataType, startDate, endDate);

  static Future<bool> requestHealthKitPermissions() =>
      HekaHealthPlatform.instance.requestHealthKitPermissions();
}
