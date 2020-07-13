import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function() onPressed;

  final Color color;

  final Widget child;

  RoundedButton({
    @required this.onPressed,
    this.child,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 180,
      height: 50,
      child: RaisedButton(
        child: child,
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
      ),
    );
  }
}
