import 'package:flutter/material.dart';
import 'package:heart_4_noobs/core/constants/routes.dart';
import 'package:heart_4_noobs/domain/usecases/mark_route_as_visited.dart';
import 'package:heart_4_noobs/locator.dart';

class LoginPageModel {
  final markRouteAsVisited = locator<MarkRouteAsVisited>();
  int selectedPageIndex;

  LoginPageModel({@required this.selectedPageIndex});

  String _getNextRoute(final String currentRoute) {
    final routes = {
      Routes.welcome: Routes.information,
      Routes.information: Routes.discord,
      Routes.discord: Routes.configuration,
      Routes.configuration: Routes.home
    };

    return routes[currentRoute];
  }

  void nextPressed(final BuildContext context) async {
    final currentRoute = ModalRoute.of(context).settings.name;

    markRouteAsVisited(currentRoute);

    selectedPageIndex = Routes.toList().indexOf(currentRoute) + 1;

    debugPrint("$selectedPageIndex");

    Navigator.pushNamed(context, _getNextRoute(currentRoute));
  }
}
