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
          await syncData(state.userUuid);
          emit(IosConnectState.syncingData(
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
    bool granted = await requestHealthKitPermissions();
    if (!granted) {
      emit(IosConnectState.error(
        const HekaHealthError.appleHealthkitPermissionsDenied(),
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
      return;
    }
    final failureOrSuccess = await _manager.makeConnection(
      userUuid: state.userUuid,
      platform: 'apple_healthkit',
    );
    failureOrSuccess.fold((error) {
      emit(IosConnectState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      await syncData(state.userUuid);
      emit(IosConnectState.syncingData(
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
