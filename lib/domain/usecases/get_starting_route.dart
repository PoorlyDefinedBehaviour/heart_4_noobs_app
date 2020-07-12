import 'dart:convert';

import 'package:heart_4_noobs/core/constants/cache.dart';
import 'package:heart_4_noobs/core/constants/routes.dart';
import 'package:heart_4_noobs/domain/infra/cache.dart';
import 'package:heart_4_noobs/locator.dart';

class GetStartingRoute {
  Cache _cache = locator<Cache>();

  Future<String> call() async {
    final cacheValued = await _cache
        .getValue(CacheKeys.visitedRoutes)
        .then((value) => value.map(json.decode));

    return cacheValued.fold(
      () => Routes.welcome,
      (visitedRoutes) {
        final routes = visitedRoutes.toSet();

        return [
          Routes.welcome,
          Routes.configuration,
          Routes.information,
          Routes.discord,
          Routes.home
        ].firstWhere((route) => !routes.contains(route));
      },
    );
  }
}
