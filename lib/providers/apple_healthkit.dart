import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';

class AppleHealthkit extends DataProvider {
  @override
  Future<OAuth2Creds?> signIn(
    HekaHealth manager,
  ) async {
    return const OAuth2Creds(refreshToken: '', email: '');
  }

  @override
  Future<void> postConnect(HekaHealth manager, String userUuid) async {
    await manager.syncIosHealthData(userUuid: userUuid);
  }

  @override
  Future<void> postDisconnect(HekaHealth manager, String userUuid) async {
    // TODO: Stop the obeserver query here
  }

  @override
  Future<void> preConnect(HekaHealth manager, String userUuid) async {
    // TODO: this will always be true according to
    // https://stackoverflow.com/questions/51231371/requesting-authorization-in-healthkit-why-the-result-is-always-successful
    bool granted = await manager.requestHealthKitPermissions();
    if (!granted) {
      throw Exception("HealthKit permissions not granted");
    }
  }
}
