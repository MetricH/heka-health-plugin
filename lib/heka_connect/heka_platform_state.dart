import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/models/connected_platform.dart';
import 'package:heka_health/models/heka_health_error.dart';

part 'heka_platform_state.freezed.dart';

@freezed
class HekaPlatformState with _$HekaPlatformState {
  const factory HekaPlatformState.initial({
    required String userUuid,
    required String? paymentPlan,
  }) = _Initial;
  const factory HekaPlatformState.checkingConnection({
    required String userUuid,
    required String? paymentPlan,
  }) = _CheckingConnection;
  const factory HekaPlatformState.noConnection({
    required String userUuid,
    required String? paymentPlan,
  }) = _NoConnection;
  const factory HekaPlatformState.tokenInvalidated(
    ConnectedPlatform connection, {
    required String userUuid,
    required String? paymentPlan,
  }) = _TokenInvalidated;
  const factory HekaPlatformState.makingConnection({
    required String userUuid,
    required String? paymentPlan,
  }) = _MakingConnection;
  const factory HekaPlatformState.disconnecting({
    required String userUuid,
    required String? paymentPlan,
  }) = _Disconnecting;
  const factory HekaPlatformState.connected(
    ConnectedPlatform connection, {
    required String userUuid,
    required String? paymentPlan,
  }) = _Connected;
  const factory HekaPlatformState.error(
    HekaHealthError error, {
    required String userUuid,
    required String? paymentPlan,
  }) = _Error;
}
