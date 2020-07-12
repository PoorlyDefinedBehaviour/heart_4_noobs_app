import 'package:flutter/material.dart';

final _primaryColor = Color(0xff9163CC);

final defaultTheme = ThemeData.light().copyWith(
    primaryColor: _primaryColor,
    textTheme: TextTheme(
      headline1: TextStyle().copyWith(
          fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold),
      bodyText2: TextStyle().copyWith(
          fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700),
      button: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold),
    ));
