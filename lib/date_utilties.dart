import 'package:intl/intl.dart';
class DateHelper {

  static String formatDate(DateTime dateTime){
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    final String formatted = dateFormat.format(dateTime);
    return formatted;
  }
}