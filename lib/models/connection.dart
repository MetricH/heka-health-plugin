import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/constants/platform_name.dart';
import 'package:heka_health/models/connected_platform.dart';
part 'connection.freezed.dart';
part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  const Connection._();
  const factory Connection({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'user_uuid') required String userUuid,
    required Map<String, ConnectedPlatform?> connections,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);

  bool connectionExists(String platform) {
    return connections[platform] != null;
  }

  bool isConnected(String platform, String? deviceId) {
    if (!connectionExists(platform)) {
      return false;
    }
    ConnectedPlatform? connectedPlatform = connections[platform];
    if (connectedPlatform == null) {
      return false;
    }
    if (platform == PlatformName.appleHealth) {
      return (connectedPlatform.connectedDevicesUUIDs ?? []).contains(deviceId);
    } else {
      return connectedPlatform.loggedIn;
    }
  }
}
