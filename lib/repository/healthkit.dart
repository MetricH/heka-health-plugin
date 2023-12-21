import 'package:heka_health/repository/heka_health_platform_interface.dart';

class HekaHealthKit {
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

  static Future<List<Object?>> getMenstrualData(
          {required DateTime startDate, required DateTime endDate}) =>
      HekaHealthPlatform.instance.getMenstrualData(startDate, endDate);
}
