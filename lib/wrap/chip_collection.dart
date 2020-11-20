import 'package:flutter/material.dart';

class ChipCollection extends StatefulWidget {
  final List<ChipInfo> initialValue;
  final void Function(List<ChipInfo>) onChanged;

  ChipCollection({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _ChipCollectionState createState() => _ChipCollectionState();
}

class _ChipCollectionState extends State<ChipCollection> {
  List<ChipInfo> currentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentList = widget.initialValue;
  }

  void onPress(ChipInfo chip) {
    final index = currentList.indexWhere((element) => element.id == chip.id);
    currentList[index] = chip;
    widget.onChanged(currentList);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: widget.initialValue
          .map((e) => ChipWidget(
                e,
                onPress: onPress,
              ))
          .toList(),
    );
  }
}

class ChipInfo extends Object {
  int id;
  String title;
  bool isChecked;

  ChipInfo({
    required this.id,
    required this.title,
    this.isChecked = false,
  });
}

class ChipWidget extends StatefulWidget {
  final ChipInfo chip;
  final void Function(ChipInfo)? onPress;

  ChipWidget(
    this.chip, {
    this.onPress,
  });

  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // toggle the status of Chip
          widget.chip.isChecked = !widget.chip.isChecked;
        });
        if (widget.onPress != null) {
          widget.onPress!(widget.chip);
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Text(widget.chip.title),
        decoration: BoxDecoration(
          color: widget.chip.isChecked ? Colors.blue : Colors.grey,
          border: Border.all(
            color: widget.chip.isChecked ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        //
      ),
    );
  }
}
