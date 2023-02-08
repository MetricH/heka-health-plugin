import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/models/connected_platform.dart';
part 'connection.freezed.dart';
part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  const Connection._();
  const factory Connection({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'uuid') required String userUuid,
    required Map<String, ConnectedPlatform?> connections,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);

  bool isPlatformConnected(String platform) {
    // TODO: add handling for logged in variable too
    return connections[platform] != null;
  }
}
