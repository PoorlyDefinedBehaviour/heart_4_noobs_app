import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final void Function() onPressed;
  final Color color;

  ArrowButton({
    @required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset("assets/images/arrow_1.png", color: this.color),
    );
  }
}
