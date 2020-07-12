import 'dart:convert';

import 'package:heart_4_noobs/core/constants/misc.dart';
import 'package:heart_4_noobs/locator.dart';
import 'package:heart_4_noobs/domain/infra/cache.dart';

class MarkRouteAsVisited {
  Cache _cache = locator<Cache>();

  static const _cacheKey = "$APP_NAME@visited_routes";

  Future<void> call(final String route) async {
    final cacheValued = await _cache.getValue(_cacheKey);

    final newCachedValue = cacheValued.fold(
      () => json.encode([route]),
      (visitedRoutes) {
        final routes = List<String>.from(json.decode(visitedRoutes));

        routes.add(route);

        return json.encode(routes);
      },
    );

    await _cache.setValue(_cacheKey, newCachedValue);
  }
}
