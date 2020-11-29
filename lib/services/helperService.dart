import 'package:intl/intl.dart';

class HelperService {
  static String getFormattedDate(DateTime date) {
    return DateFormat.Hm().format(date);
  }
}
