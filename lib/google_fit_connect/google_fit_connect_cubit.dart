import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../connection.dart';
import '../google_credentials.dart';
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

    final connection = await _manager.fetchConnection(state.userUuid);
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
  }

  Future<void> connectAgain(int connectionId) async {
    final clientId = await _manager.getGoogleClientId();
    if (clientId != null) {
      final credentials = await _manager.signInWithGoogle(
        clientId: clientId,
        redirectUrl: redirectUrl(clientId),
        issuer: _googleIssuer,
      );

      if (credentials != null) {
        emit(GoogleFitConnectState.makingConnection(userUuid: state.userUuid));
        final connection = await _manager.reConnect(
            connectionId: connectionId,
            googleFitRefreshToken: credentials.refreshToken);
        emit(GoogleFitConnectState.connected(
          connection,
          userUuid: state.userUuid,
        ));
      }
    }
  }

  Future<void> createConnection() async {
    final clientId = await _manager.getGoogleClientId();
    if (clientId != null) {
      final credentials = await _manager.signInWithGoogle(
        clientId: clientId,
        redirectUrl: redirectUrl(clientId),
        issuer: _googleIssuer,
      );
      if (credentials != null) {
        emit(GoogleFitConnectState.makingConnection(userUuid: state.userUuid));
        final connection = await _manager.makeConnection(
          userUuid: state.userUuid,
          platform: 'android',
          googleFitRefreshToken: credentials.refreshToken,
        );
        emit(GoogleFitConnectState.connected(connection,
            userUuid: state.userUuid));
      }
    }
  }
}

extension UserProfileX on AuthorizationTokenResponse {
  Future<String?> get email async {
    try {
      final requestUri = Uri.https('www.googleapis.com', 'oauth2/v1/userinfo',
          {'access_token': accessToken});
      final response = await Dio().getUri(requestUri);
      return response.data['email'];
    } on DioError {
      return null;
    }
  }
}

String redirectUrl(String clientId) {
  if (Platform.isAndroid) {
    final parts = clientId.split('.');
    return 'com.googleusercontent.apps.${parts.first}:/oauthredirect';
  }
  return '';
}
