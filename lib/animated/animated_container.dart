import 'package:flutter/material.dart';

class ExampleAnimatedContainer extends StatefulWidget {
  @override
  _ExampleAnimatedContainerState createState() =>
      _ExampleAnimatedContainerState();
}

class _ExampleAnimatedContainerState extends State<ExampleAnimatedContainer> {
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: width,
        curve: Curves.bounceIn,
        child: FlatButton(
          child: Text("+"),
          onPressed: () {
            setState(() {
              width += 10;
            });
          },
        ),
      ),
    );
  }
}
