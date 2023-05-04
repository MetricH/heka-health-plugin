import 'dart:convert';
import 'dart:io';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/enabled_platform.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';

class Strava extends DataProvider {
  final _auth = const FlutterAppAuth();
  final String _redirectUrl = "hekahealth://strava";

  final defaultScopes = [
    "activity:read",
  ];

  @override
  Future<OAuth2Creds?> signIn(HekaHealth manager, UserApp userApp) async {
    try {
      EnabledPlatform platformData =
          userApp.getEnabledPlatform(PlatformName.strava);

      final authTokenResponse = await _auth.authorize(
        AuthorizationRequest(
          platformData.platformAppId!,
          _redirectUrl,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: "https://www.strava.com/oauth/authorize",
            tokenEndpoint: "https://www.strava.com/oauth/token",
          ),
          scopes: platformData.enabledScopes ?? defaultScopes,
        ),
      );

      var authorizationCode = authTokenResponse!.authorizationCode!;

      final uri = Uri.https('www.strava.com', 'oauth/token', {
        'client_id': platformData.platformAppId!,
        'client_secret': platformData.platformAppSecret!,
        'grant_type': 'authorization_code',
        'code': authorizationCode,
      });
      final client = HttpClient();

      try {
        final request = await client.postUrl(uri);
        final response = await request.close();

        if (response.statusCode == 200) {
          final responseData = await response.transform(utf8.decoder).join();
          final decodedData = jsonDecode(responseData);
          return OAuth2Creds(
            refreshToken: decodedData['refresh_token'],
            email: "${decodedData['athlete']['id']}",
          );
        }
        return null;
      } on Exception {
        return null;
      } finally {
        client.close();
      }
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
