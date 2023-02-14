import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/repository/google_fit.dart';
import 'package:heka_health/repository/heka_repository.dart';

class GoogleFitConnectCubit extends Cubit<HekaPlatformState> {
  final HekaHealth _manager;
  final String platform;
  final GoogleFit _googleFit = GoogleFit();

  GoogleFitConnectCubit(
    this._manager,
    userUuid,
    this.platform,
  ) : super(
          HekaPlatformState.initial(
            userUuid: userUuid,
            paymentPlan: null,
          ),
        ) {
    _manager.getPlan().then((value) {
      value.fold((l) {
        emit(state.copyWith(paymentPlan: 'free'));
      }, (r) {
        emit(state.copyWith(paymentPlan: r));
      });
    });
  }

  Future<void> checkConnection() async {
    emit(HekaPlatformState.checkingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));

    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      if (connection == null || !connection.isPlatformConnected(platform)) {
        emit(HekaPlatformState.noConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      } else {
        if (platform == PlatformName.appleHealth) {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          String uuid = (await deviceInfo.iosInfo).identifierForVendor!;
          // Apple Healthkit is connected but not from this particular device
          // We show as unconnected on this device and let the user connect again
          if (!(connection.connections[PlatformName.appleHealth]!
                      .connectedDevicesUUIDs ??
                  [])
              .contains(uuid)) {
            emit(HekaPlatformState.noConnection(
              userUuid: state.userUuid,
              paymentPlan: state.paymentPlan,
            ));
            return;
          }
          emit(HekaPlatformState.connected(
            connection.connections[PlatformName.appleHealth]!,
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        } else {
          ConnectedPlatform googleFitPlatform =
              connection.connections[PlatformName.googleFit]!;
          emit(
            googleFitPlatform.loggedIn
                ? HekaPlatformState.connected(
                    googleFitPlatform,
                    userUuid: state.userUuid,
                    paymentPlan: state.paymentPlan,
                  )
                : HekaPlatformState.tokenInvalidated(
                    googleFitPlatform,
                    userUuid: state.userUuid,
                    paymentPlan: state.paymentPlan,
                  ),
          );
        }
      }
    });
  }

  Future<void> connectAgain(int id) async {
    createConnection(reconnect: true, connectionId: id);
  }

  Future<void> createConnection(
      {bool reconnect = false, int? connectionId}) async {
    emit(HekaPlatformState.makingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));

    OAuth2Creds? credentials;
    if (platform == PlatformName.googleFit) {
      final failureOrSuccess =
          await _manager.getPlatformClientId(PlatformName.googleFit);
      if (failureOrSuccess.isLeft()) {
        emit(HekaPlatformState.error(
          failureOrSuccess.fold((l) => l, (r) => throw Exception()),
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
        return;
      }
      final clientId =
          failureOrSuccess.fold((l) => throw Exception(), (r) => r);
      credentials = await _googleFit.signIn(
        clientId: clientId,
      );
      if (credentials == null) {
        emit(HekaPlatformState.error(
          // TODO: this should be a different error
          const HekaHealthError.noConnection(),
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
        return;
      }
    } else if (platform == PlatformName.appleHealth) {
      // TODO: this will always be true according to
      // https://stackoverflow.com/questions/51231371/requesting-authorization-in-healthkit-why-the-result-is-always-successful
      bool granted = await _manager.requestHealthKitPermissions();
      if (!granted) {
        emit(HekaPlatformState.error(
          const HekaHealthError.appleHealthkitPermissionsDenied(),
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
        return;
      }
      // Build a dummy OAuth2.0 creds object
      credentials = const OAuth2Creds(refreshToken: '', email: null);
    }

    String? deviceId;
    if (platform == PlatformName.appleHealth) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      deviceId = (await deviceInfo.iosInfo).identifierForVendor!;
    }
    final failureOrSuccess = await _manager.makeConnection(
      reconnect: reconnect,
      googleFitRefreshToken: credentials!.refreshToken,
      userUuid: state.userUuid,
      platform: platform,
      emailId: credentials.email,
      deviceId: deviceId,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      if (platform == PlatformName.appleHealth) {
        await _manager.syncIosHealthData(userUuid: state.userUuid);
      }
      ConnectedPlatform googleFitPlatform = connection.connections[platform]!;

      emit(HekaPlatformState.connected(
        googleFitPlatform,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    });
  }

  Future<void> disconnect(String uuid, ConnectedPlatform connection) async {
    emit(HekaPlatformState.disconnecting(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
    String? deviceId;
    if (platform == PlatformName.appleHealth) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      deviceId = (await deviceInfo.iosInfo).identifierForVendor!;
    }
    final failureOrSuccess = await _manager.disconnect(
      userUuid: uuid,
      platform: connection.platform,
      deviceId: deviceId,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      if (platform == PlatformName.appleHealth) {
        await _manager.disconnectHealthKit();
        emit(HekaPlatformState.noConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      } else {
        ConnectedPlatform googleFitPlatform =
            connection.connections[PlatformName.googleFit]!;

        emit(HekaPlatformState.tokenInvalidated(
          googleFitPlatform,
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      }
    });
  }
}
