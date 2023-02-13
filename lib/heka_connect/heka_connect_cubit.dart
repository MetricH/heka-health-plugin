import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/heka_connect/heka_connect_state.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/repository/heka_repository.dart';

class HekaConnectCubit extends Cubit<HekaConnectState> {
  final HekaHealth _manager;
  HekaConnectCubit(String userUuid, this._manager)
      : super(HekaConnectState(
          isLoading: true,
          platformStates: {},
          paymentPlan: null,
          userUuid: userUuid,
          loadingFailed: false,
        )) {
    _manager.getPlan().then((value) {
      value.fold((l) {
        emit(state.copyWith(paymentPlan: 'free'));
      }, (r) {
        emit(state.copyWith(paymentPlan: r));
      });
    });
  }

  Future<void> loadConnections() async {
    emit(state.copyWith(isLoading: true));
    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold((error) {
      emit(state.copyWith(isLoading: false, loadingFailed: true));
    }, (connection) {
      Map<String, HekaPlatformState> platformStates = {};
      connection!.connections.forEach((key, value) {
        platformStates[key] = platformStateFromConnection(connection, key);
      });
      emit(state.copyWith(
        isLoading: false,
        platformStates: platformStates,
      ));
    });
  }
}

HekaPlatformState platformStateFromConnection(
    Connection connection, String platformName) {
  if (!connection.isPlatformConnected(platformName)) {
    return HekaPlatformState.noConnection(
      userUuid: connection.userUuid,
      paymentPlan: null,
    );
  } else {
    ConnectedPlatform connectedPlatform = connection.connections[platformName]!;

    return connectedPlatform.loggedIn
        ? HekaPlatformState.connected(
            connectedPlatform,
            userUuid: connection.userUuid,
            paymentPlan: null,
          )
        : HekaPlatformState.tokenInvalidated(
            connectedPlatform,
            userUuid: connection.userUuid,
            paymentPlan: null,
          );
  }
}
