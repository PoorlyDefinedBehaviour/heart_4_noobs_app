import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/constants/routes.dart';

class LoginPageModel extends ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  String getPageForIndex(int index) {
    final pages = [
      Routes.welcome,
      Routes.information,
      Routes.discord,
      Routes.configuration,
      Routes.home
    ];

    return pages[index];
  }

  void nextTapped(final BuildContext context) {
    _currentPageIndex += 1;

    Navigator.pushNamed(context, getPageForIndex(_currentPageIndex));
  }
}
