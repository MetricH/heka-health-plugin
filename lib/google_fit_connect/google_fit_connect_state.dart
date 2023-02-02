part of 'google_fit_connect_cubit.dart';

@freezed
class GoogleFitConnectState with _$GoogleFitConnectState {
  const factory GoogleFitConnectState.initial({
    required String userUuid,
    required String? paymentPlan,
  }) = _Initial;
  const factory GoogleFitConnectState.checkingConnection({
    required String userUuid,
    required String? paymentPlan,
  }) = _CheckingConnection;
  const factory GoogleFitConnectState.noConnection({
    required String userUuid,
    required String? paymentPlan,
  }) = _NoConnection;
  const factory GoogleFitConnectState.tokenInvalidated(
    ConnectedPlatform connection, {
    required String userUuid,
    required String? paymentPlan,
  }) = _TokenInvalidated;
  const factory GoogleFitConnectState.makingConnection({
    required String userUuid,
    required String? paymentPlan,
  }) = _MakingConnection;
  const factory GoogleFitConnectState.disconnecting({
    required String userUuid,
    required String? paymentPlan,
  }) = _Disconnecting;
  const factory GoogleFitConnectState.connected(
    ConnectedPlatform connection, {
    required String userUuid,
    required String? paymentPlan,
  }) = _Connected;
  const factory GoogleFitConnectState.error(
    HekaHealthError error, {
    required String userUuid,
    required String? paymentPlan,
  }) = _Error;
}
