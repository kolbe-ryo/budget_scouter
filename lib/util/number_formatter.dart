// Package imports:
import 'package:intl/intl.dart';

class NumberFormatter {
  static currencyFormatter(int currency) {
    final formatter = NumberFormat("#,###");
    return formatter.format(currency);
  }

  static createdAtFotmat(int year, int month) {
    return '$year-$month';
  }
}
