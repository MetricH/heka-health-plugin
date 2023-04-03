import 'package:freezed_annotation/freezed_annotation.dart';
part 'heka_health_error.freezed.dart';

@freezed
class HekaHealthError with _$HekaHealthError {
  const HekaHealthError._();
  const factory HekaHealthError.noConnection(
      {@Default('Something went wrong!') String message}) = _NoConnection;
  const factory HekaHealthError.googleClientIdNotRegistered(
          {@Default('Google Client ID not registered!') String message}) =
      _GoogleClientIdNotRegistered;
  const factory HekaHealthError.appleHealthkitPermissionsDenied(
          {@Default('Apple Healthkit permissions denied!') String message}) =
      _AppleHealthkitPermissionsDenied;
}
