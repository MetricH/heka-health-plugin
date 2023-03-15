import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:heka_health/models/enabled_platform.dart';
import 'package:heka_health/repository/extensions.dart';
import 'package:heka_health/repository/heka_health_platform_interface.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/models/heka_health_error.dart';

class HekaHealth {
  final String _apiKey;
  String get apiKey => _apiKey;

  static const _baseUrl =
      'https://heka-backend.delightfulmeadow-20fa0dd3.australiaeast.azurecontainerapps.io/watch_sdk';
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  HekaHealth(this._apiKey);

  Future<Either<HekaHealthError, EnabledPlatform>> getPlatformClientId(
    String platformName,
  ) async {
    try {
      final response = await _dio.get(
        '/user_app_from_key',
        queryParameters: {
          'key': _apiKey,
        },
      );
      for (var platform in response.data?['data']?['enabled_platforms'] ?? []) {
        if (platform['platform_name'] == platformName) {
          return right(EnabledPlatform.fromJson(platform));
        }
      }
      return left(const HekaHealthError.googleClientIdNotRegistered());
    } on DioError catch (e) {
      log('----error getting client Id-------');
      log(e.toString());
      log((e.response?.data ?? "").toString());
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      rethrow;
    }
  }

  Future<Either<HekaHealthError, String>> getPlan() async {
    try {
      final response = await _dio.get(
        '/user_app_from_key',
        queryParameters: {
          'key': _apiKey,
        },
      );
      final paymentPlan = response.data?['data']?['payment_plan'] ?? '';

      if (paymentPlan.isEmpty) {
        return right('free');
      }
      return right(paymentPlan as String);
    } on DioError catch (e) {
      log('----error getting payment plan-------');
      log(e.toString());
      log((e.response?.data ?? "").toString());
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      if (e.response?.statusCode == 403) {
        return right('free');
      }
      rethrow;
    }
  }

  Future<Either<HekaHealthError, Connection?>> fetchConnection(
      String userUuid) async {
    try {
      final response = await _dio.get(
        '/check_watch_connection',
        queryParameters: {
          'key': _apiKey,
          'user_uuid': userUuid,
        },
      );
      log(response.data.toString());
      return right(Connection.fromJson(response.data['data']));
    } on DioError catch (e) {
      log('----error check connection-------');
      log(e.toString());
      log((e.response?.data ?? "").toString());
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      if (e.response?.statusCode == 404) {
        return right(null);
      }
      rethrow;
    }
  }

  Future<Either<HekaHealthError, Connection>> makeConnection({
    required String userUuid,
    required String platform,
    String? googleFitRefreshToken,
    String? emailId,
    bool reconnect = false,
    String? deviceId,
  }) async {
    try {
      final response = await _dio.post(
        '/connect_platform_for_user',
        queryParameters: {
          'key': _apiKey,
          'user_uuid': userUuid,
          'reconnect': reconnect,
        },
        data: {
          'refresh_token': googleFitRefreshToken,
          'email': emailId,
          'platform': platform,
          'device_id': deviceId,
        }..removeWhere((key, value) => value == null),
      );
      return right(Connection.fromJson(response.data['data']));
    } on DioError catch (e) {
      log(e.toString());
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      rethrow;
    }
  }

  Future<Either<HekaHealthError, Connection>> disconnect({
    required String userUuid,
    required String platform,
    String? deviceId,
  }) async {
    try {
      final response = await _dio.post(
        '/connect_platform_for_user',
        queryParameters: {
          'key': _apiKey,
          'user_uuid': userUuid,
          'disconnect': true,
        },
        data: {
          'platform': platform,
          'device_id': deviceId,
        },
      );
      return right(Connection.fromJson(response.data['data']));
    } on DioError catch (e) {
      log(e.toString());
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      rethrow;
    }
  }

  Future<bool> disconnectHealthKit() async =>
      HekaHealthPlatform.instance.disconnect();

  Future<bool> syncIosHealthData({
    required String userUuid,
    required DateTime? lastSyncTime,
  }) async =>
      HekaHealthPlatform.instance.syncIosHealthData(
        _apiKey,
        userUuid,
        lastSyncTime,
      );

  Future<bool> requestHealthKitPermissions() =>
      HekaHealthPlatform.instance.requestHealthKitPermissions();
}
