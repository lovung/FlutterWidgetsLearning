import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expanded example')),
      body: Center(
        child: Container(
          color: Colors.blue,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              MyWidget(),
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: MyWidget(),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: MyWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.yellow.shade700,
    );
  }
}
