import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:heka_health/models/google_credentials.dart';

class GoogleFit {
  final _auth = const FlutterAppAuth();

  Future<GoogleCredentials?> signInWithGoogle({
    required String clientId,
    required String redirectUrl,
    required String issuer,
  }) async {
    try {
      final authTokenResponse = await _auth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          clientId,
          redirectUrl,
          issuer: issuer,
          scopes: [
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
          ],
        ),
      );
      if (authTokenResponse != null) {
        return GoogleCredentials(
            refreshToken: authTokenResponse.refreshToken!,
            email: await authTokenResponse.email);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

extension UserProfileX on AuthorizationTokenResponse {
  Future<String?> get email async {
    try {
      final requestUri = Uri.https('www.googleapis.com', 'oauth2/v1/userinfo',
          {'access_token': accessToken});
      final response = await Dio().getUri(requestUri);
      return response.data['email'];
    } on DioError {
      return null;
    }
  }
}
