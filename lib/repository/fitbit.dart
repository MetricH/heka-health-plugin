import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/repository/data_provider.dart';

class Fitbit extends DataProvider {
  final _auth = const FlutterAppAuth();
  final String _redirectUrl = "hekahealth://fitbit";

  @override
  Future<OAuth2Creds?> signIn({
    required String clientId,
  }) async {
    try {
      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          _redirectUrl,
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

  @override
  Future<void> postConnect() async {}

  @override
  Future<void> postDisconnect() async {}

  @override
  Future<void> preConnect() async {}
}
