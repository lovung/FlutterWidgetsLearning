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

DateTime addMonths(DateTime m, int n) {
  // year, month, day := d.YMD()
  // iMonth := int(month) + n
  // if iMonth <= 0 {
  // 	iMonth -= _monthsOfYear
  // }
  // year += iMonth / _monthsOfYear
  // // This formula to calculate the new month both case n > 0 and n < 0
  // // iMonth%_monthsOfYear -> Move the negative value to [-11..0]
  // // + _monthsOfYear -> Make sure positive
  // // % _monthsOfYear -> Move the positive valid to [0..11]
  // month = time.Month((iMonth%_monthsOfYear + _monthsOfYear) % _monthsOfYear)
  // // Because a % 12 = [0..11] but the month should be [1..12]
  // if month == 0 {
  // 	month = time.December
  // }
  int month = m.month + n;
  if (month <= 0) {
    month -= DateTime.monthsPerYear;
  }
  int year = m.year + month ~/ DateTime.monthsPerYear;
  month = (month % DateTime.monthsPerYear + DateTime.monthsPerYear) %
      DateTime.monthsPerYear;
  if (month == 0) {
    month = DateTime.december;
  }

  final maxDay = daysOf(DateTime(year, month));

  return DateTime(year, month, maxDay < m.day ? maxDay : m.day);
}
