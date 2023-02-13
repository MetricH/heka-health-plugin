import 'package:flutter_appauth/flutter_appauth.dart';

class Fitbit {
  final _auth = const FlutterAppAuth();

  Future<void> signInWithFitbit({
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
        // return GoogleCredentials(
        //     refreshToken: authTokenResponse.refreshToken!,
        //     email: await authTokenResponse.email);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
