enum RadioButtonEnum {
  yes,
  no,
}

extension RadioButtonEnumExt on RadioButtonEnum {
  String get name {
    switch (this) {
      case RadioButtonEnum.yes:
        return 'Yes';
      case RadioButtonEnum.no:
        return 'No';
    }
  }

  bool get boolean {
    switch (this) {
      case RadioButtonEnum.yes:
        return true;
      case RadioButtonEnum.no:
        return false;
    }
  }
}
