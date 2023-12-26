import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/repository/heka_repository.dart';
import 'package:heka_health/repository/platform_channel.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

class GoogleFit extends DataProvider {
  final defaultScopes = [
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
  ];

  @override
  Future<OAuth2Creds?> signIn(HekaHealth manager, UserApp userApp) async {
    // TODO: move these permission handling to native code as well
    ph.PermissionStatus status =
        await ph.Permission.activityRecognition.request();
    if (status.isDenied) {
      throw const HekaHealthError.preConnectError();
    }
    // this is used to get distance in workouts
    // await ph.Permission.location.request();

    bool granted = await HekaPlatformChannel.connect();
    if (!granted) {
      throw const HekaHealthError.preConnectError();
    }
    return const OAuth2Creds(refreshToken: '', email: '');
  }

  @override
  Future<void> postConnect(
      HekaHealth manager, String userUuid, DateTime? lastSyncDate) async {}

  @override
  Future<void> postDisconnect(HekaHealth manager, String userUuid) async {
    await HekaPlatformChannel.disconnect();
  }

  @override
  Future<void> preConnect(HekaHealth manager, String userUuid) async {}
}
