import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/extensions.dart';
import 'package:heka_health/models/heka_health_error.dart';

import 'models/connection.dart';
import 'heka_health_platform_interface.dart';
import 'models/google_credentials.dart';

class HekaHealth {
  final String _apiKey;
  String get apiKey => _apiKey;

  static const _baseUrl = 'https://apidev.hekahealth.co/watch_sdk';
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  final _auth = const FlutterAppAuth();

  HekaHealth(this._apiKey);

  Future<Either<HekaHealthError, String>> getGoogleClientId() async {
    try {
      final response = await _dio.get(
        '/user_app_from_key',
        queryParameters: {
          'key': _apiKey,
        },
      );
      final clientId = response.data?['data']?['google_auth_client_id'] ?? '';

      if (clientId.isEmpty) {
        return left(const HekaHealthError.googleClientIdNotRegistered());
      }
      return right(clientId as String);
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
  }) async {
    try {
      final response = await _dio.post(
        '/connect_platform_for_user',
        queryParameters: {
          'key': _apiKey,
          'user_uuid': userUuid,
        },
        data: {
          'refresh_token': googleFitRefreshToken,
          'email': emailId,
          'platform': platform,
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

  Future<Either<HekaHealthError, Connection>> reConnect({
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
      return right(Connection.fromJson(response.data));
    } on DioError catch (e) {
      print(e);
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
      rethrow;
    }
  }

  Future<Either<HekaHealthError, Connection>> disconnect({
    required int connectionId,
  }) async {
    try {
      final response = await _dio.patch(
        '/watch_connection/$connectionId',
        queryParameters: {
          'key': _apiKey,
        },
        data: {
          'google_fit_refresh_token': null,
          "logged_in": false,
        },
      );
      return right(Connection.fromJson(response.data));
    } on DioError catch (e) {
      print(e);
      if (e.isNoConnectionError) {
        return left(const HekaHealthError.noConnection());
      }
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
        return GoogleCredentials(
            refreshToken: authTokenResponse.refreshToken!,
            email: await authTokenResponse.email);
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

extension UserProfileX on AuthorizationTokenResponse {
  Future<String?> get email async {
    try {
      final requestUri = Uri.https('www.googleapis.com', 'oauth2/v1/userinfo',
          {'access_token': accessToken});
      final response = await Dio().getUri(requestUri);
      return response.data['email'];
    } on DioError {
      return null;
    }
  }
}
