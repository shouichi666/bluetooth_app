import 'package:flutter/material.dart';

class DrumRoll extends StatelessWidget {
  const DrumRoll({
    super.key,
    required this.scrollController,
    required this.list,
    required this.currnt,
    required this.onChanged,
  });

  final ScrollController scrollController;
  final List<String> list;
  final String currnt;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollnotification) {
        return true;
      },
      child: ListWheelScrollView(
        controller: scrollController,
        physics: const FixedExtentScrollPhysics(),
        itemExtent: 96,
        diameterRatio: .61,
        onSelectedItemChanged: onChanged,
        children: list.map((String selectItem) {
          return Center(
            child: Text(
              selectItem,
              style: selectItem == currnt
                  ? Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.w600)
                  : Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.blueGrey.shade300),
            ),
          );
        }).toList(),
      ),
    );
  }
}
