import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';

class Strava extends DataProvider {
  final _auth = const FlutterAppAuth();
  final String _redirectUrl = "hekahealth://strava";

  @override
  Future<OAuth2Creds?> signIn(HekaHealth manager) async {
    try {
      final failureOrSuccess =
          await manager.getPlatformClientId(PlatformName.strava);
      if (failureOrSuccess.isLeft()) {
        return null;
      }
      final platformData =
          failureOrSuccess.fold((l) => throw Exception(), (r) => r);

      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          platformData.platformAppId!,
          _redirectUrl,
          clientSecret: platformData.platformAppSecret,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: "https://www.strava.com/oauth/authorize",
            tokenEndpoint: "https://www.strava.com/oauth/token",
          ),
          scopes: [
            "activity:read",
            "activity:read_all",
          ],
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
  Future<void> postConnect(HekaHealth manager, String userUuid) async {}

  @override
  Future<void> postDisconnect(HekaHealth manager, String userUuid) async {}

  @override
  Future<void> preConnect(HekaHealth manager, String userUuid) async {}
}
