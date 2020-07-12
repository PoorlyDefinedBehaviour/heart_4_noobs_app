import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final Widget child;

  PrimaryButton(
      {@required this.onPressed,
      this.child,
      this.text,
      this.color = Colors.white,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 180,
      height: 50,
      child: RaisedButton(
        child: child,
        onPressed: onPressed,
        color: color,
        textColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
      ),
    );
  }
}
