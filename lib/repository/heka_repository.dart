import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/models/heka_health_error.dart';

class HekaAppAndConnection {
  final UserApp userApp;
  final Connection connection;

  HekaAppAndConnection(this.userApp, this.connection);
}

class HekaHealth {
  final String _apiKey;
  String get apiKey => _apiKey;

  static const _baseUrl =
      'heka-backend.delightfulmeadow-20fa0dd3.australiaeast.azurecontainerapps.io';

  HekaHealth(this._apiKey);

  Future<Either<HekaHealthError, HekaAppAndConnection>> loadAppAndConnection(
      String userUuid) async {
    final uri = Uri.https(_baseUrl, '/watch_sdk/get_app_and_check_connection',
        {'user_uuid': userUuid});

    final client = HttpClient();

    try {
      final request = await client.getUrl(uri);
      request.headers.add('key', _apiKey);

      final response = await request.close();
      final responseData = await response.transform(utf8.decoder).join();
      final decodedData = jsonDecode(responseData);

      return right(HekaAppAndConnection(
        UserApp.fromJson(decodedData['data']['app']),
        Connection.fromJson(decodedData['data']['connection']),
      ));
    } on Exception catch (e) {
      log('----error loading user app and connection-------');
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
      'user_uuid': userUuid,
    });

    final client = HttpClient();

    try {
      final request = await client.getUrl(uri);
      request.headers.add('key', _apiKey);
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
      request.headers.add('key', _apiKey);
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
      request.headers.add('key', _apiKey);
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

  Future<Either<HekaHealthError, double>> getAggregatedDataFromServer({
    required String userUuid,
    required String platform,
    required String dataType,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final uri = Uri.https(_baseUrl, '/watch_sdk/stored_health_data', {
      'user_uuid': userUuid,
    });

    final client = HttpClient();

    try {
      HttpClientRequest request = await client.getUrl(uri);
      request.headers.add('key', _apiKey);
      request.headers.contentType = ContentType.json;
      final body = jsonEncode({
        'platform': platform,
        'data_type': dataType,
        'start_time': startDate.millisecondsSinceEpoch,
        'end_time': endDate.millisecondsSinceEpoch,
      });
      request.headers.contentLength = body.length;
      request.write(body);
      final response = await request.close();
      final responseData = await response.transform(utf8.decoder).join();
      final decodedData = jsonDecode(responseData);
      return right(decodedData['total'] ?? 0.0);
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
}
