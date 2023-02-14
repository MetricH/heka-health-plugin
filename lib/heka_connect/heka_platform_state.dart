import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/heka_health_error.dart';

part 'heka_platform_state.freezed.dart';

@freezed
class HekaPlatformState with _$HekaPlatformState {
  const factory HekaPlatformState.initial({
    required String userUuid,
  }) = _Initial;
  const factory HekaPlatformState.checkingConnection({
    required String userUuid,
  }) = _CheckingConnection;
  const factory HekaPlatformState.noConnection({
    required String userUuid,
  }) = _NoConnection;
  const factory HekaPlatformState.tokenInvalidated(
    ConnectedPlatform connection, {
    required String userUuid,
  }) = _TokenInvalidated;
  const factory HekaPlatformState.makingConnection({
    required String userUuid,
  }) = _MakingConnection;
  const factory HekaPlatformState.disconnecting({
    required String userUuid,
  }) = _Disconnecting;
  const factory HekaPlatformState.connected(
    ConnectedPlatform connection, {
    required String userUuid,
  }) = _Connected;
  const factory HekaPlatformState.error(
    HekaHealthError error, {
    required String userUuid,
  }) = _Error;
}
