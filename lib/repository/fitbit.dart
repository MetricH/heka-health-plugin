import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/repository/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';

class Fitbit extends DataProvider {
  final _auth = const FlutterAppAuth();
  final String _redirectUrl = "hekahealth://fitbit";

  @override
  Future<OAuth2Creds?> signIn(HekaHealth manager) async {
    try {
      final failureOrSuccess =
          await manager.getPlatformClientId(PlatformName.fitbit);
      if (failureOrSuccess.isLeft()) {
        return null;
      }
      final clientId =
          failureOrSuccess.fold((l) => throw Exception(), (r) => r);

      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          _redirectUrl,
          clientSecret: "73418a7586f3eacaa0e6c6158d3a81c7",
          serviceConfiguration: const AuthorizationServiceConfiguration(
            authorizationEndpoint: "https://www.fitbit.com/oauth2/authorize",
            tokenEndpoint: "https://api.fitbit.com/oauth2/token",
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
  Future<void> postConnect(HekaHealth manager, String userUuid) async {}

  @override
  Future<void> postDisconnect(HekaHealth manager, String userUuid) async {}

  @override
  Future<void> preConnect(HekaHealth manager, String userUuid) async {}
}
