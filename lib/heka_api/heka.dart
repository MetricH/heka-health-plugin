import 'dart:io';

import 'package:heka_health/heka_api/platforms.dart';
import 'package:heka_health/heka_api/types.dart';
import 'package:heka_health/repository/healthkit.dart';

class Heka {
  // TODO: we should remove the platform in future
  static Future<double?> getAggregatedForType(
    HekaDataType type,
    DateTime start,
    DateTime end,
    HekaPlatform platform,
  ) async {
    if (platform == HekaPlatform.googleFit) {
      // TODO: implement google fit
    } else if (platform == HekaPlatform.appleHealth) {
      return HekaHealthKit.getAggregatedData(
        dataType: type.toInternalString(),
        startDate: start,
        endDate: end,
      );
    }
    return null;
  }

  // Returns aggregated data for the given data type from local health store
  // NOTE: This method is only available for iOS
  static Future<double?> getAggregatedDataForIOS({
    required String apiKey,
    required String dataType,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    if (!Platform.isIOS) {
      throw Exception('This method is only available for iOS');
    }
    return HekaHealthKit.getAggregatedData(
      dataType: dataType,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
