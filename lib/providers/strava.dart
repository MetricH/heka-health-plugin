import 'package:dio/dio.dart';
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
      final response = await Dio().post(
        "https://www.strava.com/oauth/token",
        data: {
          'client_id': platformData.platformAppId!,
          'client_secret': platformData.platformAppSecret!,
          'grant_type': 'authorization_code',
          'code': authorizationCode,
        },
      );

      if (response.statusCode == 200) {
        return OAuth2Creds(
          refreshToken: response.data['refresh_token'],
          email: "${response.data['athlete']['id']}",
        );
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
