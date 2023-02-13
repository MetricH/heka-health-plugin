import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/repository/google_fit.dart';
import 'package:heka_health/repository/heka_repository.dart';

class GoogleFitConnectCubit extends Cubit<HekaPlatformState> {
  final HekaHealth _manager;
  final String _userUuid;
  final GoogleFit _googleFit = GoogleFit();

  static const _googleIssuer = 'https://accounts.google.com';

  GoogleFitConnectCubit(
    this._manager,
    this._userUuid,
  ) : super(
          HekaPlatformState.initial(
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
    }, (connection) {
      if (connection == null ||
          !connection.isPlatformConnected(PlatformName.googleFit)) {
        emit(HekaPlatformState.noConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));
      } else {
        ConnectedPlatform googleFitPlatform =
            connection.connections[PlatformName.googleFit]!;
        emit(
          googleFitPlatform.loggedIn
              ? HekaPlatformState.connected(
                  googleFitPlatform,
                  userUuid: state.userUuid,
                  paymentPlan: state.paymentPlan,
                )
              : HekaPlatformState.tokenInvalidated(
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
    final failureOrSuccess =
        await _manager.getPlatformClientId(PlatformName.googleFit);
    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
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
        emit(HekaPlatformState.makingConnection(
          userUuid: state.userUuid,
          paymentPlan: state.paymentPlan,
        ));

        final failureOrSuccess = await _manager.makeConnection(
          reconnect: reconnect,
          googleFitRefreshToken: credentials.refreshToken,
          userUuid: state.userUuid,
          platform: PlatformName.googleFit,
          emailId: credentials.email,
        );

        failureOrSuccess.fold((error) {
          emit(HekaPlatformState.error(
            error,
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        }, (connection) {
          ConnectedPlatform googleFitPlatform =
              connection.connections[PlatformName.googleFit]!;

          emit(HekaPlatformState.connected(
            googleFitPlatform,
            userUuid: state.userUuid,
            paymentPlan: state.paymentPlan,
          ));
        });
      }
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
    );

    failureOrSuccess.fold((error) {
      emit(HekaPlatformState.error(
        error,
        userUuid: state.userUuid,
        paymentPlan: state.paymentPlan,
      ));
    }, (connection) {
      ConnectedPlatform googleFitPlatform =
          connection.connections[PlatformName.googleFit]!;

      emit(HekaPlatformState.tokenInvalidated(
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
