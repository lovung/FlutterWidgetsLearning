import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/calendar/day_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pickedDateProvider =
    StateProvider<DateTime>((ref) => removeTime(DateTime.now()));

class Calendar extends StatelessWidget {
  List<Widget> _buildChildren(BuildContext context, DateTime date) {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      final newDate = removeTime(DateTime.now().add(Duration(days: i)));
      list.add(DayWidget(
        date: newDate,
      ));
    }
    list.add(Text("$date"));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Consumer(
            builder: (context, watch, _) {
              final date = watch(pickedDateProvider).state;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: _buildChildren(context, date),
              );
            },
          ),
        ),
      ),
    );
  }
}

DateTime removeTime(DateTime input) {
  return DateTime(input.year, input.month, input.day);
}
