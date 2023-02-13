import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/repository/heka_repository.dart';

class IosConnectCubit extends Cubit<HekaPlatformState> {
  final String _userUuid;
  final HekaHealth _manager;

  IosConnectCubit(
    this._userUuid,
    this._manager,
  ) : super(HekaPlatformState.initial(
          userUuid: _userUuid,
          paymentPlan: null,
        )) {
    _manager.getPlan().then((value) {
      value.fold((l) {
        emit(state.copyWith(paymentPlan: 'free'));
      }, (r) {
        emit(state.copyWith(paymentPlan: r));
      });
    });
  }

  Future<void> disconnect(String uuid, ConnectedPlatform connection) async {
    emit(HekaPlatformState.disconnecting(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String uuid = (await deviceInfo.iosInfo).identifierForVendor!;
    final failureOrSuccess = await _manager.disconnect(
      userUuid: uuid,
      platform: connection.platform,
      deviceId: uuid,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      await _manager.disconnectHealthKit();
      emit(HekaPlatformState.noConnection(
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    });
  }

  Future<void> checkConnection() async {
    emit(HekaPlatformState.checkingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold(
      (error) {
        emit(HekaPlatformState.error(
          error,
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      },
      (connection) async {
        if (connection == null ||
            connection.isPlatformConnected(PlatformName.appleHealth) == false) {
          emit(HekaPlatformState.noConnection(
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        } else {
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
        }
      },
    );
  }

  Future<void> createConnection() async {
    emit(HekaPlatformState.makingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
    // TODO: this will always be true according to
    // https://stackoverflow.com/questions/51231371/requesting-authorization-in-healthkit-why-the-result-is-always-successful
    bool granted = await requestHealthKitPermissions();
    if (!granted) {
      emit(HekaPlatformState.error(
        const HekaHealthError.appleHealthkitPermissionsDenied(),
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
      return;
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final failureOrSuccess = await _manager.makeConnection(
      userUuid: state.userUuid,
      platform: PlatformName.appleHealth,
      deviceId: (await deviceInfo.iosInfo).identifierForVendor,
    );
    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      await syncData(state.userUuid);
      emit(HekaPlatformState.connected(
        connection.connections[PlatformName.appleHealth]!,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    });
  }

  Future<void> syncData(String userUuid) async =>
      _manager.syncIosHealthData(userUuid: userUuid);

  Future<bool> requestHealthKitPermissions() =>
      _manager.requestHealthKitPermissions();

  Future<bool?> checkHealthKitPermissions() =>
      _manager.checkHealthKitPermissions();
}
