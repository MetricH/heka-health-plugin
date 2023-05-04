import 'dart:convert';
import 'dart:io';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/enabled_platform.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';

class GoogleFit extends DataProvider {
  final _auth = const FlutterAppAuth();
  static const _googleIssuer = 'https://accounts.google.com';

  final defaultScopes = [
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
  ];

  @override
  Future<OAuth2Creds?> signIn(HekaHealth manager, UserApp userApp) async {
    EnabledPlatform platformData =
        userApp.getEnabledPlatform(PlatformName.googleFit);

    try {
      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          platformData.platformAppId!,
          redirectUrl(platformData.platformAppId!),
          issuer: _googleIssuer,
          scopes: platformData.enabledScopes ?? defaultScopes,
        ),
      );
      if (authTokenResponse != null) {
        return OAuth2Creds(
            refreshToken: authTokenResponse.refreshToken!,
            email: await authTokenResponse.email);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> postConnect(
      HekaHealth manager, String userUuid, DateTime? lastSyncDate) async {}

  @override
  Future<void> postDisconnect(HekaHealth manager, String userUuid) async {}

  @override
  Future<void> preConnect(HekaHealth manager, String userUuid) async {}
}

extension UserProfileX on AuthorizationTokenResponse {
  Future<String?> get email async {
    final uri = Uri.https('www.googleapis.com', 'oauth2/v1/userinfo', {
      'access_token': accessToken,
    });

    final client = HttpClient();
    try {
      final request = await client.getUrl(uri);
      final response = await request.close();
      final responseData = await response.transform(utf8.decoder).join();
      final decodedData = jsonDecode(responseData);

      return decodedData['email'];
    } on Exception {
      return null;
    } finally {
      client.close();
    }
  }
}

String redirectUrl(String clientId) {
  if (Platform.isAndroid) {
    final parts = clientId.split('.');
    return 'com.googleusercontent.apps.${parts.first}:/oauthredirect';
  }
  return '';
}
