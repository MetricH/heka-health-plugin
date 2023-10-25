enum HekaPlatform {
  googleFit,
  appleHealth,
  fitbit,
  garmin,
  strava,
  oura,
}

extension PlatformToStr on HekaPlatform {
  String toInternalString() {
    switch (this) {
      case HekaPlatform.googleFit:
        return 'google_fit';
      case HekaPlatform.appleHealth:
        return 'apple_healthkit';
      default:
        return toString().toLowerCase().split('.').last;
    }
  }
}
