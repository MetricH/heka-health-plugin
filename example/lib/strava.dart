// import 'package:flutter/services.dart';
// import 'package:oauth2/oauth2.dart';

// const scopes = ['read'];
// final authorizationEndpoint =
//     Uri.parse('https://www.strava.com/oauth/authorize');
// final tokenEndpoint = Uri.parse('https://www.strava.com/oauth/token');
// final redirectUrl = Uri.parse('http://localhost:3000/callback');
// const clientId = '101208';
// const clientSecret = '02be9ce83847654ebd0beb337c2a5c4318c33000';

// AuthorizationCodeGrant get authorizationCodeGrant => AuthorizationCodeGrant(
//       clientId,
//       authorizationEndpoint,
//       tokenEndpoint,
//       secret: clientSecret,
//     );

// Uri getAuthorizationUrl(AuthorizationCodeGrant grant) =>
//     grant.getAuthorizationUrl(
//       redirectUrl,
//       scopes: scopes,
//     );

// Future<void> handleAuthorizationResponse(
//   AuthorizationCodeGrant grant,
//   Map<String, String> queryParams,
// ) async {
//   try {
//     final httpClient = await grant.handleAuthorizationResponse(queryParams);

//     print('Access Token: ${httpClient.credentials.accessToken}');
//     print(httpClient.credentials.refreshToken);
//   } on FormatException catch(e){
//     print('Format Exception: $e');
//   } on AuthorizationException catch (e) {
//     print(e.error);
//     print(e.description);
//   } on PlatformException {
//     print('Platform Exception');
//   }
// }
