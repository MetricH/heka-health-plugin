import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:heka_health/models/enabled_platform.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/repository/heka_health_platform_interface.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/models/heka_health_error.dart';

class HekaHealth {
  final String _apiKey;
  String get apiKey => _apiKey;

  static const _baseUrl =
      'heka-backend.delightfulmeadow-20fa0dd3.australiaeast.azurecontainerapps.io';

  HekaHealth(this._apiKey);

  Future<Either<HekaHealthError, UserApp>> loadApp() async {
    final uri =
        Uri.https(_baseUrl, '/watch_sdk/user_app_from_key', {'key': _apiKey});

    final client = HttpClient();

    try {
      final request = await client.getUrl(uri);

      final response = await request.close();
      final responseData = await response.transform(utf8.decoder).join();
      final decodedData = jsonDecode(responseData);

      return right(UserApp.fromJson(decodedData['data']));
    } on Exception catch (e) {
      log('----error loading user app-------');
      log(e.toString());
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<Either<HekaHealthError, Connection?>> fetchConnection(
    String userUuid,
  ) async {
    final uri = Uri.https(_baseUrl, '/watch_sdk/check_watch_connection', {
      'key': _apiKey,
      'user_uuid': userUuid,
    });

    final client = HttpClient();

    try {
      final request = await client.getUrl(uri);
      final response = await request.close();
      if (response.statusCode == 404) {
        return left(const HekaHealthError.noConnection());
      }

      final responseData = await response.transform(utf8.decoder).join();
      final decodedData = jsonDecode(responseData);
      return right(Connection.fromJson(decodedData['data']));
    } on SocketException catch (_) {
      return left(const HekaHealthError.noConnection());
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<Either<HekaHealthError, Connection>> makeConnection({
    required String userUuid,
    required String platform,
    String? googleFitRefreshToken,
    String? emailId,
    String? deviceId,
  }) async {
    final client = HttpClient();
    final uri = Uri.https(_baseUrl, '/watch_sdk/connect_platform_for_user', {
      'key': _apiKey,
      'user_uuid': userUuid,
    });

    final body = jsonEncode({
      'refresh_token': googleFitRefreshToken,
      'email': emailId,
      'platform': platform,
      'device_id': deviceId,
    }..removeWhere((_, value) => value == null));

    try {
      final request = await client.postUrl(uri);
      request.headers.contentType = ContentType.json;
      request.write(body);

      final response = await request.close();
      final responseData = await response.transform(utf8.decoder).join();
      final decodedData = jsonDecode(responseData);

      return right(Connection.fromJson(decodedData['data']));
    } on SocketException catch (_) {
      return left(const HekaHealthError.noConnection());
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      client.close();
    }
  }

  Future<Either<HekaHealthError, Connection>> disconnect({
    required String userUuid,
    required String platform,
    String? deviceId,
  }) async {
    final uri = Uri.https(_baseUrl, '/watch_sdk/connect_platform_for_user', {
      'key': _apiKey,
      'user_uuid': userUuid,
    });
    final client = HttpClient();
    final data = {
      'platform': platform,
      'device_id': deviceId,
      'disconnect': true,
    }..removeWhere((key, value) => value == null);

    try {
      HttpClientRequest request = await client.postUrl(uri);
      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(data));
      final response = await request.close();
      if (response.statusCode == 200) {
        final responseData = await response.transform(utf8.decoder).join();
        final decodedData = jsonDecode(responseData);

        return right(Connection.fromJson(decodedData['data']));
      }
      return left(const HekaHealthError.noConnection());
    } on Exception catch (e) {
      log(e.toString());
      if (e is SocketException) {
        return left(const HekaHealthError.noConnection());
      }
      rethrow;
    } finally {
      client.close();
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

  Future<double?> getAggregatedData(
          {required String dataType,
          required DateTime startDate,
          required DateTime endDate}) =>
      HekaHealthPlatform.instance
          .getAggregatedValueForDataType(dataType, startDate, endDate);

  Future<bool> requestHealthKitPermissions() =>
      HekaHealthPlatform.instance.requestHealthKitPermissions();
}
