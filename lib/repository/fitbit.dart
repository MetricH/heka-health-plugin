import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/models/oauth2_creds.dart';

class Fitbit {
  final _auth = const FlutterAppAuth();

  Future<OAuth2Creds?> signIn({
    required String clientId,
    required String redirectUrl,
  }) async {
    try {
      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUrl,
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: "https://www.fitbit.com/oauth2/authorize",
            tokenEndpoint: "https://www.fitbit.com/oauth2/token",
          ),
          scopes: [
            "activity",
            "cardio_fitness",
            "electrocardiogram",
            "heartrate",
            "location",
            "nutrition",
            "profile",
            "oxygen_saturation",
            "respiratory_rate",
            "sleep",
            "temperature",
            "weight"
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
}
