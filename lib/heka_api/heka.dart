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

  Future<List<MenstrualEntry>> getMenstrualData({
    required DateTime startDate,
    required DateTime endDate,
    HekaPlatform? platform,
  }) async {
    if (platform == null) {
      if (Platform.isAndroid) {
        platform = HekaPlatform.googleFit;
      } else if (Platform.isIOS) {
        platform = HekaPlatform.appleHealth;
      }
    }
    if (Platform.isAndroid) {
      Either<HekaHealthError, List<Map>> data = await _manager.getMenstrualData(
        userUuid: uuid,
        platform: 'google_fit',
        startDate: startDate,
        endDate: endDate,
      );
      return data.fold((l) => [], (r) {
        List<MenstrualEntry> entries = [];
        for (var item in r) {
          item = item as Map<String, dynamic>;
          entries.add(MenstrualEntry(
            date: DateTime.fromMicrosecondsSinceEpoch(item['start_time']),
            flow: _getFlowFromGFitEnum(item['flow'] as int),
            // we should calculate this from the data
            isStart: false,
          ));
        }
        return entries;
      });
    } else if (Platform.isIOS) {
      var data = await HekaHealthKit.getMenstrualData(
        startDate: startDate,
        endDate: endDate,
      );
      List<MenstrualEntry> entries = [];
      for (var item in data) {
        if (item != null) {
          item = item as Map;
          entries.add(MenstrualEntry(
            date: DateTime.fromMillisecondsSinceEpoch(item['date_from']),
            flow: _getFlowFromiOSEnum(item['flow'] as int),
            isStart: item['cycle_start'] ?? false,
          ));
        }
      }
      return entries;
    } else {
      throw Exception(
          'This method is only available for Google Fit and Apple Health');
    }
  }

  MenstrualEntryFlow _getFlowFromiOSEnum(int val) {
    if (val == 1) {
      return MenstrualEntryFlow.unspecificed;
    } else if (val == 2) {
      return MenstrualEntryFlow.light;
    } else if (val == 3) {
      return MenstrualEntryFlow.medium;
    } else if (val == 4) {
      return MenstrualEntryFlow.heavy;
    }
    return MenstrualEntryFlow.none;
  }

  MenstrualEntryFlow _getFlowFromGFitEnum(int val) {
    if (val == 1) {
      return MenstrualEntryFlow.spotting;
    } else if (val == 2) {
      return MenstrualEntryFlow.light;
    } else if (val == 3) {
      return MenstrualEntryFlow.medium;
    } else if (val == 4) {
      return MenstrualEntryFlow.heavy;
    }
    return MenstrualEntryFlow.none;
  }
}
