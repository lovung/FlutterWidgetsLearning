import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_widgets_learning/calendar/month_widget.dart';
import 'package:flutter_widgets_learning/calendar/util.dart';

class Calendar extends StatelessWidget {
  final DateTime initDate;

  Calendar({
    @required this.initDate,
  });

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final item = 25;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Swiper(
          index: item ~/ 2,
          itemBuilder: (BuildContext context, int index) {
            return MonthWidget(
              dateInMonth: addMonths(today, index - item ~/ 2),
            );
          },
          itemHeight: 500,
          itemWidth: 600,
          // autoplay: true,
          itemCount: item,
          scrollDirection: Axis.horizontal,
          loop: false,
          layout: SwiperLayout.TINDER,
          // pagination: SwiperPagination(alignment: Alignment.centerRight),
          // control: SwiperControl(),
        ),
      ),
    );
  }
}

DateTime removeTime(DateTime input) {
  return DateTime(input.year, input.month, input.day);
}
