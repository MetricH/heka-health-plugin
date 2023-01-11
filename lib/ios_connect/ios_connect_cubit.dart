import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../connection.dart';
import '../heka_health.dart';
part 'ios_connect_state.dart';
part 'ios_connect_cubit.freezed.dart';

class IosConnectCubit extends Cubit<IosConnectState> {
  final String _userUuid;
  final HekaHealth _manager;

  IosConnectCubit(
    this._userUuid,
    this._manager,
  ) : super(IosConnectState.initial(userUuid: _userUuid));

  void editUserUuid(String value) {
    emit(IosConnectState.initial(userUuid: value));
  }

  Future<void> checkConnection(
      Future<dynamic> Function(String, String) onConnect) async {
    emit(IosConnectState.checkingConnection(userUuid: state.userUuid));
    // Cache user uuid
    final connection = await _manager.fetchConnection(state.userUuid);
    if (connection == null) {
      await _createConnection(onConnect);
    } else {
      await onConnect(_manager.apiKey, state.userUuid);
      emit(IosConnectState.syncingData(connection, userUuid: state.userUuid));
    }
  }

  Future<void> _createConnection(
      Future<dynamic> Function(String, String) onConnect) async {
    emit(IosConnectState.makingConnection(userUuid: state.userUuid));
    final connection = await _manager.makeConnection(
      userUuid: state.userUuid,
      platform: 'ios',
    );
    await onConnect(_manager.apiKey, state.userUuid);
    emit(IosConnectState.syncingData(connection, userUuid: state.userUuid));
  }

  Future<void> syncData(String userUuid) async =>
      _manager.syncIosHealthData(userUuid: userUuid);
}
