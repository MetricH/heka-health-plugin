import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_platform.freezed.dart';
part 'connected_platform.g.dart';

@freezed
class ConnectedPlatform with _$ConnectedPlatform {
  const ConnectedPlatform._();
  const factory ConnectedPlatform({
    @JsonKey(name: 'platform_name') required String platform,
    required bool loggedIn,
    required String lastSync,
  }) = _ConnectedPlatform;

  factory ConnectedPlatform.fromJson(Map<String, dynamic> json) =>
      _$ConnectedPlatformFromJson(json);
}
