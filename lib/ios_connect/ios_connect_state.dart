part of 'ios_connect_cubit.dart';

@freezed
class IosConnectState with _$IosConnectState {
  const factory IosConnectState.initial(
      {required String userUuid, required String? paymentPlan}) = _Initial;
  const factory IosConnectState.noConnection(
      {required String userUuid, required String? paymentPlan}) = _NoConnection;
  const factory IosConnectState.checkingConnection(
      {required String userUuid,
      required String? paymentPlan}) = _CheckingConnection;
  const factory IosConnectState.makingConnection(
      {required String userUuid,
      required String? paymentPlan}) = _MakingConnection;
  const factory IosConnectState.connected(Connection connection,
      {required String userUuid, required String? paymentPlan}) = _Connected;
  const factory IosConnectState.error(HekaHealthError error,
      {required String userUuid, required String? paymentPlan}) = _Error;
}
