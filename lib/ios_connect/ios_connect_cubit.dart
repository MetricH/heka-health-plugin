import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/heka_health_helper.dart';
import 'package:heka_health/models/heka_health_error.dart';

import '../models/connection.dart';
part 'ios_connect_state.dart';
part 'ios_connect_cubit.freezed.dart';

class IosConnectCubit extends Cubit<IosConnectState> {
  final String _userUuid;
  final HekaHealth _manager;

  IosConnectCubit(
    this._userUuid,
    this._manager,
  ) : super(IosConnectState.initial(
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

  Future<void> disconnect() async {
    // TODO: implement this method
  }

  Future<void> checkConnection() async {
    emit(IosConnectState.checkingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold(
      (error) {
        emit(IosConnectState.error(
          error,
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      },
      (connection) async {
        if (connection == null ||
            connection.isPlatformConnected('apple_healthkit') == false) {
          emit(IosConnectState.noConnection(
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        } else {
          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
          String uuid = (await deviceInfo.iosInfo).identifierForVendor!;
          // Apple Healthkit is connected but not from this particular device
          // We show as unconnected on this device and let the user connect again
          if (!(connection
                      .connections['apple_healthkit']!.connectedDevicesUUIDs ??
                  [])
              .contains(uuid)) {
            emit(IosConnectState.noConnection(
              userUuid: state.userUuid,
              paymentPlan: state.paymentPlan,
            ));
            return;
          }
          emit(IosConnectState.connected(
            connection,
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        }
      },
    );
  }

  Future<void> createConnection() async {
    emit(IosConnectState.makingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
    // TODO: this will always be true according to
    // https://stackoverflow.com/questions/51231371/requesting-authorization-in-healthkit-why-the-result-is-always-successful
    bool granted = await requestHealthKitPermissions();
    if (!granted) {
      emit(IosConnectState.error(
        const HekaHealthError.appleHealthkitPermissionsDenied(),
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
      return;
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final failureOrSuccess = await _manager.makeConnection(
      userUuid: state.userUuid,
      platform: 'apple_healthkit',
      deviceId: (await deviceInfo.iosInfo).identifierForVendor,
    );
    failureOrSuccess.fold((error) {
      emit(IosConnectState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      await syncData(state.userUuid);
      emit(IosConnectState.connected(
        connection,
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
