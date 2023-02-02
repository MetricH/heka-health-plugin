import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_credentials.freezed.dart';

@freezed
class GoogleCredentials with _$GoogleCredentials {
  const GoogleCredentials._();
  const factory GoogleCredentials({
    required String refreshToken,
    required String? email,
  }) = _GoogleCredentials;
}
