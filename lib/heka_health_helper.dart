import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import 'connection.dart';
import 'heka_health_platform_interface.dart';
import 'google_credentials.dart';

class HekaHealth {
  final String _apiKey;
  String get apiKey => _apiKey;

  static const _baseUrl = 'https://apidev.hekahealth.co/watch_sdk';
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  final _auth = const FlutterAppAuth();

  HekaHealth(this._apiKey);

  Future<String?> getGoogleClientId() async {
    //  GET {{baseUrl}}/user_app?key={{apiKey}}
    try {
      final response = await _dio.get(
        '/user_app_from_key',
        queryParameters: {
          'key': _apiKey,
        },
      );
      final clientId = response.data?['data']?['google_auth_client_id'] ?? '';

      if (clientId.isEmpty) {
        return null;
      }
      return clientId;
    } on DioError catch (e) {
      print('----error getting client Id-------');
      print(e);
      print(e.response?.data);
      return null;
    }
  }

  Future<Connection?> fetchConnection(String userUuid) async {
    try {
      final response = await _dio.get(
        '/check_watch_connection',
        queryParameters: {
          'key': _apiKey,
          'user_uuid': userUuid,
        },
      );
      print(response.data);
      return Connection.fromJson(response.data['data']);
    } on DioError catch (e) {
      print('----error check connection-------');
      print(e);
      print(e.response?.data);
      return null;
    }
  }

  Future<Connection> makeConnection({
    required String userUuid,
    required String platform,
    String? googleFitRefreshToken,
  }) async {
    try {
      final response = await _dio.post(
        '/watch_connection',
        queryParameters: {
          'key': _apiKey,
          'user_uuid': userUuid,
          'platform': platform,
        },
        data: {
          'google_fit_refresh_token': googleFitRefreshToken,
        }..removeWhere((key, value) => value == null),
      );
      return Connection.fromJson(response.data['data']);
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Connection> reConnect({
    required int connectionId,
    required String googleFitRefreshToken,
  }) async {
    try {
      final response = await _dio.patch(
        '/watch_connection/$connectionId',
        queryParameters: {
          'key': _apiKey,
        },
        data: {
          'google_fit_refresh_token': googleFitRefreshToken,
          "logged_in": true,
        },
      );
      return Connection.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<GoogleCredentials?> signInWithGoogle({
    required String clientId,
    required String redirectUrl,
    required String issuer,
  }) async {
    try {
      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUrl,
          issuer: issuer,
          scopes: [
            'email',
            'https://www.googleapis.com/auth/fitness.activity.read',
            'https://www.googleapis.com/auth/fitness.blood_glucose.read',
            'https://www.googleapis.com/auth/fitness.blood_pressure.read',
            'https://www.googleapis.com/auth/fitness.body.read',
            'https://www.googleapis.com/auth/fitness.body_temperature.read',
            'https://www.googleapis.com/auth/fitness.heart_rate.read',
            'https://www.googleapis.com/auth/fitness.location.read',
            'https://www.googleapis.com/auth/fitness.nutrition.read',
            'https://www.googleapis.com/auth/fitness.oxygen_saturation.read',
            'https://www.googleapis.com/auth/fitness.reproductive_health.read',
            'https://www.googleapis.com/auth/fitness.sleep.read',
          ],
        ),
      );
      if (authTokenResponse != null) {
        return GoogleCredentials(refreshToken: authTokenResponse.refreshToken!);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

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
