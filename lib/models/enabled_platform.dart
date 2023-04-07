import 'package:freezed_annotation/freezed_annotation.dart';

part 'enabled_platform.freezed.dart';
part 'enabled_platform.g.dart';

@freezed
class EnabledPlatform with _$EnabledPlatform {
  const factory EnabledPlatform({
    @JsonKey(name: 'platform_name') required String platformName,
    @JsonKey(name: 'platform_app_id') required String? platformAppId,
    @JsonKey(name: 'platform_app_secret') required String? platformAppSecret,
    @JsonKey(name: 'enabled_scopes') required List<String>? enabledScopes,
  }) = _EnabledPlatform;

  factory EnabledPlatform.fromJson(Map<String, dynamic> json) =>
      _$EnabledPlatformFromJson(json);
}
