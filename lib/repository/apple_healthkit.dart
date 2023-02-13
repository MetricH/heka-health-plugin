import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/repository/data_provider.dart';

class AppleHealthkit extends DataProvider {
  Future<OAuth2Creds?> signIn({
    required String clientId,
  }) async {}

  @override
  Future<void> postConnect() async {
    // TODO: call syncIOSHealthData here
  }

  @override
  Future<void> postDisconnect() async {
    // TODO: Stop the obeserver query here
  }

  @override
  Future<void> preConnect() async {
    // TODO: get permissions here from healthkit
  }
}
