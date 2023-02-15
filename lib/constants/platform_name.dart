import 'package:heka_health/constants/images.dart';

class PlatformName {
  static const String googleFit = 'google_fit';
  static const String appleHealth = 'apple_healthkit';
  static const String fitbit = 'fitbit';
}

class PlatformDetails {
  final String name;
  final String imageUri;
  final bool worksOniOS;
  final bool worksOnAndroid;

  PlatformDetails(
    this.name,
    this.imageUri,
    this.worksOniOS,
    this.worksOnAndroid,
  );
}

Map<String, PlatformDetails> platforms = {
  'google_fit': PlatformDetails(
    'Google Fit',
    HekaImages.googleFit,
    false,
    true,
  ),
  'apple_healthkit': PlatformDetails(
    'Apple Healthkit',
    HekaImages.appleHealth,
    true,
    false,
  ),
  'fitbit': PlatformDetails(
    'Fitbit',
    HekaImages.fitbit,
    true,
    true,
  ),
};
