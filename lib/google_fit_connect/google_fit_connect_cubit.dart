import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/heka_health_error.dart';
import 'package:heka_health/repository/google_fit.dart';
import 'package:heka_health/repository/heka_repository.dart';

part 'google_fit_connect_state.dart';
part 'google_fit_connect_cubit.freezed.dart';

class GoogleFitConnectCubit extends Cubit<GoogleFitConnectState> {
  final HekaHealth _manager;
  final String _userUuid;
  final GoogleFit _googleFit = GoogleFit();

  static const _googleIssuer = 'https://accounts.google.com';

  GoogleFitConnectCubit(
    this._manager,
    this._userUuid,
  ) : super(
          GoogleFitConnectState.initial(
            userUuid: _userUuid,
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
    emit(GoogleFitConnectState.checkingConnection(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));

    final failureOrSuccess = await _manager.fetchConnection(state.userUuid);
    failureOrSuccess.fold((error) {
      emit(GoogleFitConnectState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) {
      if (connection == null || !connection.isPlatformConnected('google_fit')) {
        emit(GoogleFitConnectState.noConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      } else {
        ConnectedPlatform googleFitPlatform =
            connection.connections['google_fit']!;
        emit(
          googleFitPlatform.loggedIn
              ? GoogleFitConnectState.connected(
                  googleFitPlatform,
                  userUuid: state.userUuid,
                  paymentPlan: state.paymentPlan,
                )
              : GoogleFitConnectState.tokenInvalidated(
                  googleFitPlatform,
                  userUuid: state.userUuid,
                  paymentPlan: state.paymentPlan,
                ),
        );
      }
    });
  }

  Future<void> connectAgain(int id) async {
    createConnection(reconnect: true, connectionId: id);
  }

  Future<void> createConnection(
      {bool reconnect = false, int? connectionId}) async {
    final failureOrSuccess = await _manager.getPlatformClientId('google_fit');
    failureOrSuccess.fold((error) {
      emit(GoogleFitConnectState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (clientId) async {
      final credentials = await _googleFit.signIn(
        clientId: clientId,
        redirectUrl: redirectUrl(clientId),
        issuer: _googleIssuer,
      );
      if (credentials != null) {
        emit(GoogleFitConnectState.makingConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));

        final failureOrSuccess = await _manager.makeConnection(
          reconnect: reconnect,
          googleFitRefreshToken: credentials.refreshToken,
          userUuid: state.userUuid,
          platform: 'google_fit',
          emailId: credentials.email,
        );

        failureOrSuccess.fold((error) {
          emit(GoogleFitConnectState.error(
            error,
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        }, (connection) {
          ConnectedPlatform googleFitPlatform =
              connection.connections['google_fit']!;

          emit(GoogleFitConnectState.connected(
            googleFitPlatform,
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        });
      }
    });
  }

  Future<void> disconnect(String uuid, ConnectedPlatform connection) async {
    emit(GoogleFitConnectState.disconnecting(
      userUuid: state.userUuid,
      paymentPlan: state.paymentPlan,
    ));
    final failureOrSuccess = await _manager.disconnect(
      userUuid: uuid,
      platform: connection.platform,
    );

    failureOrSuccess.fold((error) {
      emit(GoogleFitConnectState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) {
      ConnectedPlatform googleFitPlatform =
          connection.connections['google_fit']!;

      emit(GoogleFitConnectState.tokenInvalidated(
        googleFitPlatform,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
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
