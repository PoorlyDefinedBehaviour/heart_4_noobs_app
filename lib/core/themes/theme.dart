import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/themes/dark_theme.dart';
import './default_theme.dart';

enum ThemeType { Default, Dark }

class ThemeModel extends ChangeNotifier {
  ThemeData _theme = defaultTheme;

  ThemeData get theme => _theme;

  setTheme(final ThemeType type) {
    if (type == ThemeType.Default) {
      _theme = defaultTheme;
    } else if (type == ThemeType.Dark) {
      _theme = darkTheme;
    }

    notifyListeners();
  }
}
