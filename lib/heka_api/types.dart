enum HekaDataType {
  steps,
  calories,
  distanceMoved,
  moveMinutes,
  height,
  weight,
  bloodOxygen,
  restingHeartRate,
  floorsClimbed,
}

extension TypeToStr on HekaDataType {
  String toInternalString() {
    switch (this) {
      case HekaDataType.distanceMoved:
        return 'distance_moved';
      case HekaDataType.moveMinutes:
        return 'move_minutes';
      case HekaDataType.restingHeartRate:
        return 'resting_heart_rate';
      case HekaDataType.floorsClimbed:
        return 'floors_climbed';
      case HekaDataType.bloodOxygen:
        return 'blood_oxygen';
      default:
        return toString().toLowerCase().split('.').last;
    }
  }
}
