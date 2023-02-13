import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/heka_connect/heka_platform_state.dart';

part 'heka_connect_state.freezed.dart';

@freezed
class HekaConnectState with _$HekaConnectState {
  const factory HekaConnectState({
    required bool isLoading,
    required Map<String, HekaPlatformState> platformStates,
    required String? paymentPlan,
  }) = _HekaConnectState;
}
