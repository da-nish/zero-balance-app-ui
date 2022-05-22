import 'package:intl/intl.dart';

extension StringExtension on String {
  String toDate() {
    final DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(DateTime.parse(this));
  }

  String capitalize() {
    return isNotEmpty ? "${this[0].toUpperCase()}${substring(1)}" : "";
  }

  String rupee() {
    return "\u{20B9} ${this}";
  }
}
