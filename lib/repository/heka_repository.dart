import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:heka_health/extensions.dart';
import 'package:heka_health/heka_health_platform_interface.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/models/heka_health_error.dart';

class HekaHealth {
  final String _apiKey;
  String get apiKey => _apiKey;

  static const _baseUrl = 'https://apidev.hekahealth.co/watch_sdk';
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  HekaHealth(this._apiKey);

  Future<Either<HekaHealthError, String>> getPlatformClientId(
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
          return right(platform['platform_app_id'] as String);
        }
      }
      return left(const HekaHealthError.googleClientIdNotRegistered());
    } on DioError catch (e) {
      print('----error getting client Id-------');
      print(e);
      print(e.response?.data);
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
      print('----error getting payment plan-------');
      print(e);
      print(e.response?.data);
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
      print(response.data);
      return right(Connection.fromJson(response.data['data']));
    } on DioError catch (e) {
      print('----error check connection-------');
      print(e);
      print(e.response?.data);
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
      print(e);
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
      print(e);
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      rethrow;
    }
  }

  Future<bool> disconnectHealthKit() async =>
      HekaHealthPlatform.instance.disconnect();

  Future<int> syncIosHealthData({
    required String userUuid,
  }) async =>
      HekaHealthPlatform.instance.syncIosHealthData(
        _apiKey,
        userUuid,
      );

  Future<bool> requestHealthKitPermissions() =>
      HekaHealthPlatform.instance.requestHealthKitPermissions();

  Future<bool?> checkHealthKitPermissions() =>
      HekaHealthPlatform.instance.checkHealthKitPermissions();
}
