import 'package:heka_health/repository/heka_health_platform_interface.dart';

class HekaPlatformChannel {
  static Future<bool> connect() => HekaHealthPlatform.instance.connect();

  static Future<bool> disconnect() => HekaHealthPlatform.instance.disconnect();

  static Future<Map<DateTime, double>> getDateWiseData(
          {required String dataType,
          required DateTime startDate,
          required DateTime endDate}) =>
      HekaHealthPlatform.instance.getDateWiseData(dataType, startDate, endDate);
}
