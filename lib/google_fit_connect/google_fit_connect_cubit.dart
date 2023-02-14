import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/repository/apple_healthkit.dart';
import 'package:heka_health/repository/data_provider.dart';
import 'package:heka_health/repository/fitbit.dart';
import 'package:heka_health/repository/google_fit.dart';
import 'package:heka_health/repository/heka_repository.dart';

class GoogleFitConnectCubit extends Cubit<HekaPlatformState> {
  final HekaHealth _manager;
  final String platform;
  String? _deviceId;

  final Map<String, DataProvider> _dataProviders = {
    PlatformName.googleFit: GoogleFit(),
    PlatformName.appleHealth: AppleHealthkit(),
    PlatformName.fitbit: Fitbit(),
  };

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
    if (platform == PlatformName.appleHealth) {
      (DeviceInfoPlugin().iosInfo).then((value) {
        _deviceId = value.identifierForVendor;
      });
    }
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
      if (connection == null || !connection.connectionExists(platform)) {
        emit(HekaPlatformState.noConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
        return;
      }

      if (connection.isConnected(platform, _deviceId)) {
        emit(HekaPlatformState.connected(
          connection.connections[platform]!,
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      } else {
        emitTokenInvalidated(connection);
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

    DataProvider provider = _dataProviders[platform]!;
    try {
      provider.preConnect(_manager, state.userUuid);
    } catch (e) {
      emit(HekaPlatformState.error(
        const HekaHealthError.appleHealthkitPermissionsDenied(),
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
      return;
    }

    final OAuth2Creds? credentials = await provider.signIn(_manager);
    if (credentials == null) {
      emit(HekaPlatformState.error(
        const HekaHealthError.noConnection(),
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
      return;
    }

    final failureOrSuccess = await _manager.makeConnection(
      reconnect: reconnect,
      googleFitRefreshToken: credentials.refreshToken,
      userUuid: state.userUuid,
      platform: platform,
      emailId: credentials.email,
      deviceId: _deviceId,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      provider.postConnect(_manager, state.userUuid);
      emit(HekaPlatformState.connected(
        connection.connections[platform]!,
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

    final failureOrSuccess = await _manager.disconnect(
      userUuid: uuid,
      platform: connection.platform,
      deviceId: _deviceId,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) async {
      await _dataProviders[platform]!.postDisconnect(_manager, state.userUuid);
      emitTokenInvalidated(connection);
    });
  }

  emitTokenInvalidated(Connection connection) {
    if (platform == PlatformName.appleHealth) {
      emit(HekaPlatformState.noConnection(
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
      return;
    }
    emit(HekaPlatformState.tokenInvalidated(
      connection.connections[platform]!,
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
  }
}
