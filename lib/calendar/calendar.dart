import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/calendar/month_widget.dart';
import 'package:flutter_widgets_learning/calendar/util.dart';

class Calendar extends StatefulWidget {
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
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  PageController calendarCltr;

  @override
  void initState() {
    calendarCltr = PageController(
      initialPage: countMonths(widget.startDate, widget.initDate) - 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: PageView.builder(
          controller: calendarCltr,
          itemCount: countMonths(widget.startDate, widget.endDate),
          itemBuilder: (context, index) {
            final firstDateOfMonth =
                DateTime(widget.startDate.year, widget.startDate.month + index);

            return Column(
              children: [
                MonthWidget(
                  firstDate: firstDateOfMonth,
                  enableFrom: widget.startDate,
                  enableTo: widget.endDate,
                  controller: calendarCltr,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
