import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/enabled_platform.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';

class Oura extends DataProvider {
  final _auth = const FlutterAppAuth();
  final String _redirectUrl = "hekahealth://oura";

  final defaultScopes = [
    "email",
    "personal",
    "daily",
    "heartrate",
    "workout",
    "tag",
    "session",
    "spo2",
  ];

  @override
  Future<OAuth2Creds?> signIn(HekaHealth manager, UserApp userApp) async {
    try {
      EnabledPlatform platformData =
          userApp.getEnabledPlatform(PlatformName.oura);

      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          platformData.platformAppId!,
          _redirectUrl,
          clientSecret: platformData.platformAppSecret,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: "https://cloud.ouraring.com/oauth/authorize",
            tokenEndpoint: "https://api.ouraring.com/oauth/token",
          ),
          scopes: platformData.enabledScopes ?? defaultScopes,
        ),
      );
      if (authTokenResponse != null) {
        return OAuth2Creds(
          refreshToken: authTokenResponse.refreshToken!,
          email: null,
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
