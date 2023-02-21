import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'heka_health_method_channel.dart';

abstract class HekaHealthPlatform extends PlatformInterface {
  /// Constructs a HekaHealthPlatform.
  HekaHealthPlatform() : super(token: _token);

  static final Object _token = Object();

  static HekaHealthPlatform _instance = MethodChannelHekaHealth();

  /// The default instance of [HekaHealthPlatform] to use.
  ///
  /// Defaults to [MethodChannelHekaHealth].
  static HekaHealthPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HekaHealthPlatform] when
  /// they register themselves.
  static set instance(HekaHealthPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> syncIosHealthData(String apiKey, String userUuid) {
    throw UnimplementedError('syncIosHealthData() has not been implemented.');
  }

  Future<bool> requestHealthKitPermissions() {
    throw UnimplementedError(
        'requestHealthKitPermissions() has not been implemented.');
  }

  Future<bool> disconnect() {
    throw UnimplementedError('disconnect() has not been implemented.');
  }
}
