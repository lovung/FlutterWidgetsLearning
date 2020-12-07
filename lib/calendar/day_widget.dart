import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets_learning/calendar/calendar.dart';

class DayWidget extends StatelessWidget {
  final DateTime date;
  final bool isEnabled;
  final activeColor = Colors.orangeAccent;

  DayWidget({
    @required this.date,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPicked = date == context.read(pickedDateProvider).state;
    return SizedBox(
      height: 50,
      width: 44,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isEnabled && isPicked ? activeColor : Colors.white,
          border: Border.all(
            color: isEnabled && isPicked ? activeColor : Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: () {
            if (!isEnabled) {
              return;
            }
            context.read(pickedDateProvider).state = date;
          },
          child: Center(
            child: Text(
              "${date.day}",
              style: TextStyle(
                color: isEnabled ? Colors.black : Colors.black12,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
