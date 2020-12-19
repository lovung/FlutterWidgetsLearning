import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/calendar/month_widget.dart';
import 'package:flutter_widgets_learning/calendar/util.dart';

class Calendar extends StatelessWidget {
  final DateTime initDate;
  final DateTime startDate;
  final DateTime endDate;

  Calendar({
    @required this.initDate,
    @required this.startDate,
    @required this.endDate,
  }) {
    assert(removeTime(startDate).isAtSameMomentAs(startDate));
    assert(removeTime(endDate).isAtSameMomentAs(endDate));
    assert(!initDate.isBefore(startDate));
    assert(!initDate.isAfter(endDate));
  }

  @override
  Widget build(BuildContext context) {
    final index = countMonths(startDate, initDate) - 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: PageView.builder(
          controller: PageController(initialPage: index),
          itemCount: countMonths(startDate, endDate),
          itemBuilder: (context, index) {
            // final int newYM =
            //     firstDateOf(startDate).year * DateTime.monthsPerYear +
            //         firstDateOf(startDate).month +
            //         index;
            // final DateTime firstDateOfMonth = DateTime(
            //     newYM ~/ DateTime.monthsPerYear,
            //     newYM % DateTime.monthsPerYear);

            final firstDateOfMonth =
                DateTime(startDate.year, startDate.month + index);

            return Column(
              children: [
                MonthWidget(
                  firstDate: firstDateOfMonth,
                  enableFrom: max(firstDateOfMonth, startDate),
                  enableTo: min(endDate, lastDateOf(firstDateOfMonth)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
