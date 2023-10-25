import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/heka_connect/application/heka_connect_state.dart';
import 'package:heka_health/heka_connect/application/heka_platform_state.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/connection.dart';
import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/models/oauth2_creds.dart';
import 'package:heka_health/models/user_app.dart';
import 'package:heka_health/providers/apple_healthkit.dart';
import 'package:heka_health/providers/data_provider.dart';
import 'package:heka_health/providers/exceptions.dart';
import 'package:heka_health/providers/fitbit.dart';
import 'package:heka_health/providers/google_fit.dart';
import 'package:heka_health/providers/strava.dart';
import 'package:heka_health/repository/heka_repository.dart';

class HekaConnectCubit extends Cubit<HekaConnectState> {
  final HekaHealth _manager;
  UserApp? _userApp;

  final Map<String, DataProvider> _dataProviders = {
    PlatformName.googleFit: GoogleFit(),
    PlatformName.appleHealth: AppleHealthkit(),
    PlatformName.fitbit: Fitbit(),
    PlatformName.strava: Strava(),
  };

  Future<String?> getDeviceId(String platformName) async {
    if (platformName == PlatformName.appleHealth) {
      return (await DeviceInfoPlugin().iosInfo).identifierForVendor;
    }
    return null;
  }

  HekaConnectCubit(String userUuid, this._manager)
      : super(HekaConnectState(
          isLoading: true,
          platformStates: {},
          paymentPlan: null,
          userUuid: userUuid,
          loadingFailed: false,
        )) {
    _manager.loadAppAndConnection(userUuid).then((value) {
      value.fold((l) {
        emit(state.copyWith(paymentPlan: 'free', loadingFailed: true));
      }, (r) async {
        _userApp = r.userApp;
        Connection connection = r.connection;
        Map<String, HekaPlatformState> platformStates = {};
        // TODO: find a better way to do this
        String? deviceId = await getDeviceId(PlatformName.appleHealth);
        connection.connections.forEach((key, value) {
          platformStates[key] =
              platformStateFromConnection(connection, key, deviceId);
        });
        // remove google fit if on ios and vice versa
        if (Platform.isAndroid &&
            platformStates.containsKey(PlatformName.appleHealth)) {
          platformStates.remove(PlatformName.appleHealth);
        } else if (Platform.isIOS &&
            platformStates.containsKey(PlatformName.googleFit)) {
          platformStates.remove(PlatformName.googleFit);
        }
        emit(state.copyWith(
          paymentPlan: r.userApp.paymentPlan == 'free' ? 'free' : 'paid',
          platformStates: platformStates,
          isLoading: false,
        ));
      });
    });
  }

  Future<void> createConnection(
      {int? connectionId, required String platformName}) async {
    emit(state.copyWith(
      platformStates: {
        ...state.platformStates,
        platformName: HekaPlatformState.makingConnection(
          userUuid: state.userUuid,
        ),
      },
    ));

    DataProvider provider = _dataProviders[platformName]!;
    try {
      provider.preConnect(_manager, state.userUuid);
    } catch (e) {
      emit(state.copyWith(
        platformStates: {
          ...state.platformStates,
          platformName: HekaPlatformState.error(
            const HekaHealthError.appleHealthkitPermissionsDenied(),
            userUuid: state.userUuid,
          ),
        },
      ));
      return;
    }

    OAuth2Creds? credentials;
    try {
      credentials = await provider.signIn(_manager, _userApp!);
    } catch (e) {
      if (e is AppIdNotFoundException) {
        emit(state.copyWith(
          platformStates: {
            ...state.platformStates,
            platformName: HekaPlatformState.error(
              const HekaHealthError.googleClientIdNotRegistered(),
              userUuid: state.userUuid,
            ),
          },
        ));
        return;
      } else {
        rethrow;
      }
    }

    if (credentials == null) {
      emit(state.copyWith(
        platformStates: {
          ...state.platformStates,
          platformName: HekaPlatformState.error(
            const HekaHealthError.noConnection(),
            userUuid: state.userUuid,
          ),
        },
      ));
      return;
    }
    final failureOrSuccess = await _manager.makeConnection(
      googleFitRefreshToken: credentials.refreshToken,
      userUuid: state.userUuid,
      platform: platformName,
      emailId: credentials.email,
      deviceId: await getDeviceId(platformName),
    );

    failureOrSuccess.fold((error) {
      emit(state.copyWith(
        platformStates: {
          ...state.platformStates,
          platformName: HekaPlatformState.error(
            error,
            userUuid: state.userUuid,
          ),
        },
      ));
    }, (connection) async {
      emit(state.copyWith(
        platformStates: {
          ...state.platformStates,
          platformName: HekaPlatformState.connected(
            connection.connections[platformName]!,
            userUuid: state.userUuid,
          ),
        },
      ));
      provider.postConnect(_manager, state.userUuid,
          connection.connections[platformName]!.lastSync);
    });
  }

  Future<void> disconnect(
      String uuid, ConnectedPlatform connectedPlatform) async {
    emit(state.copyWith(
      platformStates: {
        ...state.platformStates,
        connectedPlatform.platform: HekaPlatformState.disconnecting(
          userUuid: state.userUuid,
        ),
      },
    ));

    final failureOrSuccess = await _manager.disconnect(
      userUuid: uuid,
      platform: connectedPlatform.platform,
      deviceId: await getDeviceId(connectedPlatform.platform),
    );

    failureOrSuccess.fold((error) {
      emit(state.copyWith(
        platformStates: {
          ...state.platformStates,
          connectedPlatform.platform: HekaPlatformState.error(
            error,
            userUuid: state.userUuid,
          ),
        },
      ));
    }, (connection) async {
      await _dataProviders[connectedPlatform.platform]!
          .postDisconnect(_manager, state.userUuid);
      emitTokenInvalidated(connection, connectedPlatform.platform);
    });
  }

  emitTokenInvalidated(Connection connection, String platformName) {
    if (platformName == PlatformName.appleHealth) {
      emit(state.copyWith(
        platformStates: {
          ...state.platformStates,
          platformName: HekaPlatformState.noConnection(
            userUuid: state.userUuid,
          ),
        },
      ));
      return;
    }
    emit(state.copyWith(
      platformStates: {
        ...state.platformStates,
        platformName: HekaPlatformState.tokenInvalidated(
          connection.connections[platformName]!,
          userUuid: state.userUuid,
        ),
      },
    ));
  }
}

HekaPlatformState platformStateFromConnection(
    Connection connection, String platformName, String? deviceId) {
  if (!connection.connectionExists(platformName)) {
    return HekaPlatformState.noConnection(
      userUuid: connection.userUuid,
    );
  } else {
    if (connection.isConnected(platformName, deviceId)) {
      return HekaPlatformState.connected(
        connection.connections[platformName]!,
        userUuid: connection.userUuid,
      );
    } else if (platformName == PlatformName.appleHealth) {
      return HekaPlatformState.noConnection(
        userUuid: connection.userUuid,
      );
    } else {
      return HekaPlatformState.tokenInvalidated(
        connection.connections[platformName]!,
        userUuid: connection.userUuid,
      );
    }
  }
}
