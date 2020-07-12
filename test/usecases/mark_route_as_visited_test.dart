import 'dart:convert';

import 'package:dartz/dartz.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:heart_4_noobs/domain/infra/cache.dart';
import 'package:heart_4_noobs/domain/usecases/mark_route_as_visited.dart';
import 'package:heart_4_noobs/locator.dart';
import "package:mockito/mockito.dart";

class MockCache extends Mock implements Cache {}

void main() {
  final mockCache = MockCache();

  locator.registerSingleton<Cache>(mockCache);

  final markRouteAsVisited = MarkRouteAsVisited();

  group("MarkRouteAsVisited use case unit test suite", () {
    test(
        "when no route has been visited yet, should cache a list with a single route [routeName]",
        () async {
      when(mockCache.getValue(any))
          .thenAnswer((realInvocation) => Future.value(None()));

      const route = "some_route";

      await markRouteAsVisited(route);

      verify(mockCache.setValue(any, json.encode([route])));
    });

    test(
        "when a route route has been visited before, should append the new visited route to the previous visited routes list [..., routeName]",
        () async {
      const previouslyVisitedRoutes = ["route a", "route b"];

      when(mockCache.getValue(any)).thenAnswer(
        (realInvocation) =>
            Future.value(Some(json.encode(previouslyVisitedRoutes))),
      );

      const route = "some_route";

      await markRouteAsVisited(route);

      verify(mockCache.setValue(
          any, json.encode([...previouslyVisitedRoutes, route])));
    });
  });
}
