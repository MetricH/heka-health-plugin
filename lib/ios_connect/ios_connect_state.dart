part of 'ios_connect_cubit.dart';

@freezed
class IosConnectState with _$IosConnectState {
  const factory IosConnectState.initial({
    required String userUuid,
  }) = _Initial;
  const factory IosConnectState.noConnection({
    required String userUuid,
  }) = _NoConnection;
  const factory IosConnectState.checkingConnection({
    required String userUuid,
  }) = _CheckingConnection;
  const factory IosConnectState.makingConnection({
    required String userUuid,
  }) = _MakingConnection;
  const factory IosConnectState.syncingData(
    Connection connection, {
    required String userUuid,
  }) = _SyncingData;
}
