import 'package:freezed_annotation/freezed_annotation.dart';
part 'connection.freezed.dart';
part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  const Connection._();
  const factory Connection({
    required int id,
    @JsonKey(name: 'user_uuid') required String userUuid,
    required String platform,
    @JsonKey(name: 'google_fit_refresh_token') String? googleFitRefreshToken,
    required int app,
    @JsonKey(name: 'logged_in') required bool loggedIn,
    @JsonKey(name: 'last_sync') String? lastSync,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}
