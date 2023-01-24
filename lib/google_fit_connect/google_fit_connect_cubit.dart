import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/heka_health_error.dart';

import '../connection.dart';
import '../heka_health.dart';

part 'google_fit_connect_state.dart';
part 'google_fit_connect_cubit.freezed.dart';

class GoogleFitConnectCubit extends Cubit<GoogleFitConnectState> {
  final HekaHealth _manager;
  final String _userUuid;

  static const _googleIssuer = 'https://accounts.google.com';

  GoogleFitConnectCubit(
    this._manager,
    this._userUuid,
  ) : super(
          GoogleFitConnectState.initial(userUuid: _userUuid),
        );

  Future<void> checkConnection() async {
    emit(GoogleFitConnectState.checkingConnection(userUuid: state.userUuid));

    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold((error) {
      emit(GoogleFitConnectState.error(error, userUuid: state.userUuid));
    }, (connection) {
      if (connection == null) {
        emit(GoogleFitConnectState.noConnection(userUuid: state.userUuid));
      } else {
        emit(
          connection.loggedIn
              ? GoogleFitConnectState.connected(connection,
                  userUuid: state.userUuid)
              : GoogleFitConnectState.tokenInvalidated(connection,
                  userUuid: state.userUuid),
        );
      }
    });
  }

  Future<void> connectAgain(int id) async {
    createConnection(reconnect: true, connectionId: id);
  }

  Future<void> createConnection(
      {bool reconnect = false, int? connectionId}) async {
    final failureOrSuccess = await _manager.getGoogleClientId();
    failureOrSuccess.fold((error) {
      emit(GoogleFitConnectState.error(error, userUuid: state.userUuid));
    }, (clientId) async {
      final credentials = await _manager.signInWithGoogle(
        clientId: clientId,
        redirectUrl: redirectUrl(clientId),
        issuer: _googleIssuer,
      );
      if (credentials != null) {
        emit(GoogleFitConnectState.makingConnection(userUuid: state.userUuid));

        if (reconnect) {
          final failureOrSuccess = await _manager.reConnect(
              connectionId: connectionId!,
              googleFitRefreshToken: credentials.refreshToken);
          failureOrSuccess.fold((error) {
            emit(GoogleFitConnectState.error(error, userUuid: state.userUuid));
          }, (connection) {
            emit(GoogleFitConnectState.connected(connection,
                userUuid: state.userUuid));
          });
        } else {
          final failureOrSuccess = await _manager.makeConnection(
            userUuid: state.userUuid,
            platform: 'android',
            emailId: credentials.email,
            googleFitRefreshToken: credentials.refreshToken,
          );
          failureOrSuccess.fold((error) {
            emit(GoogleFitConnectState.error(error, userUuid: state.userUuid));
          }, (connection) {
            emit(GoogleFitConnectState.connected(connection,
                userUuid: state.userUuid));
          });
        }
      }
    });
  }

  Future<void> disconnect(int connectionId) async {
    emit(GoogleFitConnectState.makingConnection(userUuid: state.userUuid));
    final failureOrSuccess = await _manager.disconnect(
      connectionId: connectionId,
    );

    failureOrSuccess.fold((error) {
      emit(GoogleFitConnectState.error(error, userUuid: state.userUuid));
    }, (connection) {
      emit(GoogleFitConnectState.tokenInvalidated(connection,
          userUuid: state.userUuid));
    });
  }
}

String redirectUrl(String clientId) {
  if (Platform.isAndroid) {
    final parts = clientId.split('.');
    return 'com.googleusercontent.apps.${parts.first}:/oauthredirect';
  }
  return '';
}
