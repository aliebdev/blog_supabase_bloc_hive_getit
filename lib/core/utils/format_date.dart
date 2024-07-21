import 'package:intl/intl.dart';

String fomateDateByMMMYYY(DateTime dateTime) {
  return DateFormat("d MMM, yyyy").format(dateTime);
}
