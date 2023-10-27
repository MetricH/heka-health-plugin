import 'package:heka_health/constants/images.dart';

class PlatformName {
  static const String googleFit = 'google_fit';
  static const String appleHealth = 'apple_healthkit';
  static const String fitbit = 'fitbit';
  static const String strava = 'strava';
  static const String oura = 'oura';
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
    'Apple Health',
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
  'strava': PlatformDetails(
    'Strava',
    HekaImages.strava,
    true,
    true,
  ),
  'oura': PlatformDetails(
    'Oura',
    HekaImages.oura,
    true,
    true,
  ),
};
