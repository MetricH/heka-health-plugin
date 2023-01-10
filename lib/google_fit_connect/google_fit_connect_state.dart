part of 'google_fit_connect_cubit.dart';

@freezed
class GoogleFitConnectState with _$GoogleFitConnectState {
  const factory GoogleFitConnectState.initial({
    required String userUuid,
  }) = _Initial;
  const factory GoogleFitConnectState.checkingConnection({
    required String userUuid,
  }) = _CheckingConnection;
  const factory GoogleFitConnectState.noConnection({
    required String userUuid,
  }) = _NoConnection;
  const factory GoogleFitConnectState.tokenInvalidated(
    Connection connection, {
    required String userUuid,
  }) = _TokenInvalidated;
  const factory GoogleFitConnectState.makingConnection({
    required String userUuid,
  }) = _MakingConnection;
  const factory GoogleFitConnectState.connected(
    Connection connection, {
    required String userUuid,
  }) = _Connected;
}
