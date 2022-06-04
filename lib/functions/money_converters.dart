import 'package:intl/intl.dart';

/// function for convert double to money
String moneyConverters(double value) {
  final formtter = NumberFormat.currency(
    symbol: "Rp. ",
    decimalDigits: 0,
    locale: "id_ID",
  );
  return formtter.format(value);
}
