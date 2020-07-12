import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    backgroundColor: Color(0xff0E0E0E),
    accentColor: Colors.cyan[600],

    // Define the default font family.
    fontFamily: 'SF Pro Text',

    // Define the default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ));
