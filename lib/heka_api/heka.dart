import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:heka_health/heka_api/platforms.dart';
import 'package:heka_health/heka_api/types.dart';
import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/repository/healthkit.dart';
import 'package:heka_health/repository/heka_repository.dart';

class Heka {
  final HekaHealth _manager;
  final String uuid;

  Heka(String apiKey, this.uuid) : _manager = HekaHealth(apiKey);

  Future<double?> getAggregatedForType(
    HekaDataType type,
    DateTime start,
    DateTime end,
    HekaPlatform platform,
  ) async {
    if (platform == HekaPlatform.googleFit) {
      Either<HekaHealthError, double> resp =
          await _manager.getAggregatedDataFromServer(
        userUuid: uuid,
        platform: 'google_fit',
        dataType: type.toInternalString(),
        startDate: start,
        endDate: end,
      );
      return resp.fold((l) {
        return null;
      }, (r) {
        return r;
      });
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
    required HekaDataType dataType,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    if (!Platform.isIOS) {
      throw Exception('This method is only available for iOS');
    }
    return HekaHealthKit.getAggregatedData(
      dataType: dataType.toInternalString(),
      startDate: startDate,
      endDate: endDate,
    );
  }
}
