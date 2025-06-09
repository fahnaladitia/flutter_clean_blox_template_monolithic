import 'package:intl/intl.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

extension DateTimeExtension on DateTime {
  String display([String format = 'dd MMM yyyy']) {
    return DateFormat(format).format(this);
  }
}
