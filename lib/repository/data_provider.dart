import 'package:heka_health/models/oauth2_creds.dart';

abstract class DataProvider {
  // Called before the user is redirected to the data provider's sign in page
  // and before the connection is created on server
  Future<void> preConnect();

  // Handles redirecting to relevant OAuth2 sign in page and returns the creds
  Future<OAuth2Creds?> signIn({
    required String clientId,
  });

  // Called after the connection is created on server
  Future<void> postConnect();

  // Called after the connection is deleted on server
  Future<void> postDisconnect();
}
