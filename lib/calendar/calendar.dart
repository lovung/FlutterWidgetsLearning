import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/calendar/day_widget.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime pickedDate = DateTime.now();
  DateTime isPicked = DateTime.now();

  void onPickedCallback(DateTime b) {
    setState(() {
      isPicked = b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DayWidget(
                date: DateTime.now(),
                onPicked: onPickedCallback,
              ),
              DayWidget(
                date: DateTime.now().add(Duration(days: 1)),
                onPicked: onPickedCallback,
              ),
              DayWidget(
                date: DateTime.now().add(Duration(days: 2)),
                onPicked: onPickedCallback,
              ),
              DayWidget(
                date: DateTime.now().add(Duration(days: 3)),
                onPicked: onPickedCallback,
                isPicked: true,
              ),
              DayWidget(
                date: DateTime.now().add(Duration(days: 4)),
                onPicked: onPickedCallback,
                isEnabled: false,
              ),
              Text("$isPicked"),
            ],
          ),
        ),
      ),
    );
  }
}
