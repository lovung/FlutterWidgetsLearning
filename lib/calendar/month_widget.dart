import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/calendar/day_widget.dart';
import 'package:flutter_widgets_learning/calendar/state.dart';
import 'package:flutter_widgets_learning/calendar/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MonthWidget extends StatelessWidget {
  final DateTime firstDate;
  final DateTime enableFrom;
  final DateTime enableTo;

  MonthWidget({
    @required this.firstDate,
    this.enableFrom,
    this.enableTo,
  }) : assert(firstDate.isAtSameMomentAs(removeTime(firstDate)));

  final _yearTextStyle = TextStyle(fontSize: 30);
  final _monthTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  final _weekdayTextStyle = TextStyle(
    color: Colors.black38,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  DateTime get _firstDate => firstDate;
  DateTime get _lastDate => lastDateOf(firstDate);

  DateTime get _enableFrom => enableFrom ?? firstDate;
  DateTime get _enableTo => enableTo ?? lastDateOf(firstDate);

  List<Widget> _buildChildren(BuildContext context) {
    final int daysOfPreviousMonth = _firstDate.weekday - DateTime.monday;
    final int daysOfNextMonth = DateTime.sunday - _lastDate.weekday;
    List<Widget> list = [];
    final DateTime _startDate =
        _firstDate.subtract(Duration(days: daysOfPreviousMonth));

    for (int i = 0;
        i < daysOfPreviousMonth + daysOf(firstDate) + daysOfNextMonth;
        i++) {
      final runDay = _startDate.add(Duration(days: i));
      list.add(
        DayWidget(
          date: runDay,
          isEnabled:
              !runDay.isBefore(_enableFrom) && !runDay.isAfter(_enableTo),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(getMonthString(_firstDate), style: _monthTextStyle),
                  Text(" ${_firstDate.year}", style: _yearTextStyle),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(strOfWeekday(DateTime.monday),
                        style: _weekdayTextStyle),
                    Text(strOfWeekday(DateTime.tuesday),
                        style: _weekdayTextStyle),
                    Text(strOfWeekday(DateTime.wednesday),
                        style: _weekdayTextStyle),
                    Text(strOfWeekday(DateTime.thursday),
                        style: _weekdayTextStyle),
                    Text(strOfWeekday(DateTime.friday),
                        style: _weekdayTextStyle),
                    Text(strOfWeekday(DateTime.saturday),
                        style: _weekdayTextStyle),
                    Text(strOfWeekday(DateTime.sunday),
                        style: _weekdayTextStyle),
                  ],
                ),
              ),
              Divider(endIndent: 10, indent: 10),
              Consumer(builder: (context, watch, child) {
                watch(pickedDateProvider).state;
                return Wrap(
                  children: _buildChildren(context),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
