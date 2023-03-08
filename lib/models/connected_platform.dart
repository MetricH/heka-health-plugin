import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_platform.freezed.dart';
part 'connected_platform.g.dart';

@freezed
class ConnectedPlatform with _$ConnectedPlatform {
  const ConnectedPlatform._();
  const factory ConnectedPlatform({
    @JsonKey(name: 'platform_name') required String platform,
    @JsonKey(name: 'logged_in') required bool loggedIn,
    @JsonKey(name: 'last_sync') required DateTime? lastSync,
    @JsonKey(name: 'connected_device_uuids')
        required List<String>? connectedDevicesUUIDs,
  }) = _ConnectedPlatform;

  factory ConnectedPlatform.fromJson(Map<String, dynamic> json) =>
      _$ConnectedPlatformFromJson(json);
}
