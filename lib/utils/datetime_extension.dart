import 'package:intl/intl.dart';

extension TimeExtensions on DateTime {
  String dateFormat() {
    String format = 'd MMM';
    if (this.year < DateTime.now().year) format = 'd MMM yyyy';
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }
}
