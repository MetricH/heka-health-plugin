import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/repository/heka_repository.dart';

abstract class DataProvider {
  // Called before the user is redirected to the data provider's sign in page
  // and before the connection is created on server
  Future<void> preConnect(HekaHealth manager, String userUuid);

  // Handles redirecting to relevant OAuth2 sign in page and returns the creds
  Future<OAuth2Creds?> signIn(HekaHealth manager);

  // Called after the connection is created on server
  Future<void> postConnect(HekaHealth manager, String userUuid);

  // Called after the connection is deleted on server
  Future<void> postDisconnect(HekaHealth manager, String userUuid);
}
