import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heka_health/models/connected_platform.dart';
part 'connection.freezed.dart';
part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  const Connection._();
  const factory Connection({
    required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'user_uuid') required String userUuid,
    required String platform,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'google_fit_refresh_token') String? googleFitRefreshToken,
    required int app,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'logged_in') required bool loggedIn,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_sync') String? lastSync,
    @JsonKey(name: 'connected_platforms')
        required List<ConnectedPlatform> connectedPlatforms,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}
