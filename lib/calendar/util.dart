import 'package:intl/intl.dart';

final _moonLanding = DateTime.parse("1969-07-20 20:18:04Z");

DateTime removeTime(DateTime input) {
  return DateTime(input.year, input.month, input.day);
}

String getMonthString(DateTime d) {
  return DateFormat(DateFormat.MONTH).format(d);
}

String strOfWeekday(int weekday) {
  final d = _moonLanding.add(Duration(days: weekday));
  return DateFormat(DateFormat.ABBR_WEEKDAY)
      .format(d)
      .toLowerCase()
      .substring(0, 2);
}

DateTime firstDateOf(DateTime m) {
  m = removeTime(m);
  return DateTime(m.year, m.month, 1);
}

DateTime lastDateOf(DateTime m) {
  m = removeTime(m);
  return DateTime(m.year, m.month + 1, 1).subtract(Duration(days: 1));
}

int daysOf(DateTime m) {
  return lastDateOf(m).day;
}

int countMonths(DateTime startDate, DateTime endDate) {
  assert(!startDate.isAfter(endDate));
  return (endDate.year - startDate.year) * DateTime.monthsPerYear +
      (endDate.month - startDate.month) +
      1;
}

DateTime min(DateTime d1, DateTime d2) {
  if (d1.isBefore(d2)) {
    return d1;
  }
  return d2;
}

DateTime max(DateTime d1, DateTime d2) {
  if (d1.isBefore(d2)) {
    return d2;
  }
  return d1;
}
