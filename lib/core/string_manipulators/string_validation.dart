extension StringValidationExtension on String? {
  bool get hasActualValue {
    if (this == null || this == "null" || this!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
