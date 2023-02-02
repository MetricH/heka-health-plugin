import 'package:freezed_annotation/freezed_annotation.dart';
part 'heka_health_error.freezed.dart';

@freezed
class HekaHealthError with _$HekaHealthError {
  const HekaHealthError._();
  const factory HekaHealthError.noConnection(
      {@Default('Please check your internet!') String message}) = _NoConnection;
  const factory HekaHealthError.googleClientIdNotRegistered(
          {@Default('Google Client ID not registered!') String message}) =
      _GoogleClientIdNotRegistered;
}
