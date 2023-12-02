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

enum MenstrualEntryFlow { unspecificed, light, medium, heavy, none, spotting }

class MenstrualEntry {
  final DateTime date;
  final MenstrualEntryFlow flow;
  final bool isStart;

  MenstrualEntry(
      {required this.date, required this.flow, required this.isStart});

  @override
  String toString() {
    return 'MenstrualEntry(date: $date, flow: $flow, isStart: $isStart)';
  }
}
