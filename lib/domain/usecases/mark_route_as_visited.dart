import 'dart:convert';

import 'package:heart_4_noobs/core/constants/cache.dart';
import 'package:heart_4_noobs/locator.dart';
import 'package:heart_4_noobs/domain/infra/cache.dart';

class MarkRouteAsVisited {
  Cache _cache = locator<Cache>();

  Future<void> call(final String route) async {
    final cacheValued = await _cache.getValue(CacheKeys.visitedRoutes);

    final newCachedValue = cacheValued.fold(
      () => json.encode([route]),
      (visitedRoutes) => json.encode(json.decode(visitedRoutes)..add(route)),
    );

    await _cache.setValue(CacheKeys.visitedRoutes, newCachedValue);
  }
}
