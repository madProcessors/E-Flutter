import 'package:intl/intl.dart';

class Utils {
  static String getDate(bool soloFecha) {
    DateFormat formatter;

    if (soloFecha) {
      formatter = DateFormat('yyyy-MM-dd');
    } else {
      formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    }

    final String formatted = formatter.format(DateTime.now());
    return formatted;
  }
}
