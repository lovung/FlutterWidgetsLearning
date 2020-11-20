import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/wrap/chip_collection.dart';

class WrapExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification example')),
      body: Center(
        child: Wrap(
          runSpacing: 10,
          spacing: 30,
          direction: Axis.vertical,
          alignment: WrapAlignment.end,
          children: List.generate(
            20,
            (index) => CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WrapExample2 extends StatefulWidget {
  @override
  _WrapExample2State createState() => _WrapExample2State();
}

class _WrapExample2State extends State<WrapExample2> {
  List<ChipInfo> chips = List.generate(
    20,
    (index) => ChipInfo(id: index + 1, title: "Chip ${index + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification example')),
      body: Center(
        child: ChipCollection(
          initialValue: chips,
          onChanged: (newChips) {
            chips = newChips;
            print(chips.where((element) => element.isChecked).length);
            // TODO: Do your own business logic here
          },
        ),
      ),
    );
  }
}
