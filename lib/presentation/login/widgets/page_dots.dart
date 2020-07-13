import 'package:flutter/material.dart';

class PageDots extends StatelessWidget {
  final int selectedPageIndex;

  PageDots({@required this.selectedPageIndex});

  List<Widget> makeDots() {
    final dot = Icon(
      Icons.fiber_manual_record,
      color: Colors.white,
      size: 15,
    );

    final selectedDot = Icon(
      Icons.fiber_manual_record,
      color: Colors.grey,
      size: 16,
    );

    List<Widget> dots = [];

    for (int i = 0; i < 3; i += 1) {
      dots.add(SizedBox(
        width: 10,
      ));

      dots.add(i == selectedPageIndex ? selectedDot : dot);

      dots.add(SizedBox(
        width: 10,
      ));
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center, children: makeDots());
  }
}
