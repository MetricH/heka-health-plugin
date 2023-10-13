enum HekaDataType {
  steps,
  calories,
}

extension TypeToStr on HekaDataType {
  String toInternalString() {
    return toString().toLowerCase().split('.').last;
  }
}
