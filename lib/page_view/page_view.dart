import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          MyPage(
            color: Colors.greenAccent,
            // number: controller.page,
          ),
          MyPage(
            color: Colors.redAccent,
            // number: controller.page,
          ),
          MyPage(
            color: Colors.yellowAccent,
            // number: controller.page,
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final Color color;
  // final double number;

  MyPage({
    required this.color,
    // @required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      // child: Text(
      //   "${number ?? ""}",
      //   style: TextStyle(fontSize: 40),
      // ),
    );
  }
}
