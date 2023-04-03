import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/models/enabled_platform.dart';

part 'user_app.freezed.dart';
part 'user_app.g.dart';

@freezed
class UserApp with _$UserApp {
  const UserApp._();

  factory UserApp({
    @JsonKey(name: 'enabled_platforms')
        required List<EnabledPlatform> enabledPlatforms,
    @JsonKey(name: 'payment_plan') required String paymentPlan,
  }) = _UserApp;

  factory UserApp.fromJson(Map<String, dynamic> json) =>
      _$UserAppFromJson(json);

  EnabledPlatform getEnabledPlatform(String platformName) {
    return enabledPlatforms.firstWhere(
      (element) => element.platformName == platformName,
    );
  }
}
