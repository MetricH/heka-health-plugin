import 'package:freezed_annotation/freezed_annotation.dart';
part 'oauth2_creds.freezed.dart';

@freezed
class OAuth2Creds with _$OAuth2Creds {
  const OAuth2Creds._();
  const factory OAuth2Creds({
    required String refreshToken,
    required String? email,
  }) = _OAuth2Creds;
}
