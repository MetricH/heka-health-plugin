import 'package:device_info_plus/device_info_plus.dart';
import 'package:heka_health/repository/heka_repository.dart';

import 'constants/platform_name.dart';

class HekaManager {
  /// Returns whether the user is connected to the given platform or not
  static Future<bool> isUserConnected(
      {required String key,
      required String uuid,
      required String platformName}) async {
    var repo = HekaHealth(key);
    var failureOrSuccess = await repo.fetchConnection(uuid);
    return failureOrSuccess.fold((error) => false, (connection) async {
      if (connection == null) {
        return false;
      }
      String? deviceId;
      if (platformName == PlatformName.appleHealth) {
        deviceId = (await DeviceInfoPlugin().iosInfo).identifierForVendor;
      }
      return connection.isConnected(platformName, deviceId);
    });
  }

  // Returns aggregated data for the given data type from local health store
  // NOTE: This method is only available for iOS
  static Future<double?> getAggregatedDataForIOS({
    required String apiKey,
    required String dataType,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return HekaHealth(apiKey).getAggregatedData(
      dataType: dataType,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
