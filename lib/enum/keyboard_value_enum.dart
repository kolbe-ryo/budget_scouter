enum KeyboardValue {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  clear,
  zero,
  ok,
}

extension KeyboardValueExt on KeyboardValue {
  String get value {
    switch (this) {
      case KeyboardValue.one:
        return '1';
      case KeyboardValue.two:
        return '2';
      case KeyboardValue.three:
        return '3';
      case KeyboardValue.four:
        return '4';
      case KeyboardValue.five:
        return '5';
      case KeyboardValue.six:
        return '6';
      case KeyboardValue.seven:
        return '7';
      case KeyboardValue.eight:
        return '8';
      case KeyboardValue.nine:
        return '9';
      case KeyboardValue.clear:
        return 'C';
      case KeyboardValue.zero:
        return '0';
      case KeyboardValue.ok:
        return 'OK';
    }
  }
}
