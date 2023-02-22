import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/providers/data_provider.dart';
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
      final platformData =
          failureOrSuccess.fold((l) => throw Exception(), (r) => r);

      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          platformData.platformAppId!,
          _redirectUrl,
          clientSecret: platformData.platformAppSecret,
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
            "weight",
            "settings",
          ],
        ),
      );
      if (authTokenResponse != null) {
        return OAuth2Creds(
          refreshToken: authTokenResponse.refreshToken!,
          email: authTokenResponse.tokenAdditionalParameters!["user_id"],
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
