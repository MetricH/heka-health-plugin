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
          ),
        ) {
    if (platform == PlatformName.appleHealth) {
      (DeviceInfoPlugin().iosInfo).then((value) {
        _deviceId = value.identifierForVendor;
      });
    }
  }

  Future<void> checkConnection() async {
    emit(HekaPlatformState.checkingConnection(
      userUuid: state.userUuid,
    ));

    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
      ));
    }, (connection) async {
      if (connection == null || !connection.connectionExists(platform)) {
        emit(HekaPlatformState.noConnection(
          userUuid: state.userUuid,
        ));
        return;
      }

      if (connection.isConnected(platform, _deviceId)) {
        emit(HekaPlatformState.connected(
          connection.connections[platform]!,
          userUuid: state.userUuid,
        ));
      } else {
        emitTokenInvalidated(connection, platform);
      }
    });
  }

  Future<void> connectAgain(String platformName, int id) async {
    createConnection(
        reconnect: true, connectionId: id, platformName: platformName);
  }

  Future<void> createConnection(
      {bool reconnect = false,
      int? connectionId,
      required String platformName}) async {
    emit(HekaPlatformState.makingConnection(
      userUuid: state.userUuid,
    ));

    DataProvider provider = _dataProviders[platformName]!;
    try {
      provider.preConnect(_manager, state.userUuid);
    } catch (e) {
      emit(HekaPlatformState.error(
        const HekaHealthError.appleHealthkitPermissionsDenied(),
        userUuid: state.userUuid,
      ));
      return;
    }

    final OAuth2Creds? credentials = await provider.signIn(_manager);
    if (credentials == null) {
      emit(HekaPlatformState.error(
        const HekaHealthError.noConnection(),
        userUuid: state.userUuid,
      ));
      return;
    }

    final failureOrSuccess = await _manager.makeConnection(
      reconnect: reconnect,
      googleFitRefreshToken: credentials.refreshToken,
      userUuid: state.userUuid,
      platform: platformName,
      emailId: credentials.email,
      deviceId: _deviceId,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
      ));
    }, (connection) async {
      provider.postConnect(_manager, state.userUuid);
      emit(HekaPlatformState.connected(
        connection.connections[platformName]!,
        userUuid: state.userUuid,
      ));
    });
  }

  Future<void> disconnect(
      String uuid, ConnectedPlatform connectedPlatform) async {
    emit(HekaPlatformState.disconnecting(
      userUuid: state.userUuid,
    ));

    final failureOrSuccess = await _manager.disconnect(
      userUuid: uuid,
      platform: connectedPlatform.platform,
      deviceId: _deviceId,
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
      ));
    }, (connection) async {
      await _dataProviders[connectedPlatform.platform]!
          .postDisconnect(_manager, state.userUuid);
      emitTokenInvalidated(connection, connectedPlatform.platform);
    });
  }

  emitTokenInvalidated(Connection connection, String platformName) {
    if (platformName == PlatformName.appleHealth) {
      emit(HekaPlatformState.noConnection(
        userUuid: state.userUuid,
      ));
      return;
    }
    emit(HekaPlatformState.tokenInvalidated(
      connection.connections[platform]!,
      userUuid: state.userUuid,
    ));
  }
}
