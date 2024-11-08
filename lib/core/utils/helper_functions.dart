import 'package:intl/intl.dart';

String formattedTime(DateTime date) {
  final diffInDays = date.difference(DateTime.now()).inDays;
  if (diffInDays > 2) {
    return DateFormat('MMM d').format(date);
  } else {
    return DateFormat('hh:mma').format(date);
  }
}
