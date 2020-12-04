import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  final DateTime date;
  final bool isEnabled;
  final bool isPicked;
  final ValueChanged<DateTime> onPicked;

  DayWidget({
    required this.date,
    this.isEnabled = true,
    this.isPicked = false,
    required this.onPicked,
  }) : assert(isEnabled || !isPicked);

  @override
  _DayWidgetState createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  bool isPicked = false;
  final activeColor = Colors.orangeAccent;

  @override
  void initState() {
    isPicked = widget.isPicked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 44,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.isEnabled && isPicked ? activeColor : Colors.white,
          border: Border.all(
            color: widget.isEnabled && isPicked ? activeColor : Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap: () {
            if (!widget.isEnabled) {
              return;
            }
            setState(() {
              isPicked = !isPicked;
            });
            if (isPicked) {
              widget.onPicked(widget.date);
            }
          },
          child: Center(
            child: Text(
              "${widget.date.day}",
              style: TextStyle(
                color: widget.isEnabled ? Colors.black : Colors.black12,
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
