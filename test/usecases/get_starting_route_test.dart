import 'dart:convert';

import 'package:dartz/dartz.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:heart_4_noobs/core/constants/routes.dart';
import 'package:heart_4_noobs/domain/infra/cache.dart';
import 'package:heart_4_noobs/domain/usecases/get_starting_route.dart';
import 'package:heart_4_noobs/locator.dart';
import "package:mockito/mockito.dart";

class MockCache extends Mock implements Cache {}

void main() {
  final mockCache = MockCache();

  locator.registerSingleton<Cache>(mockCache);

  final getStartingRoute = GetStartingRoute();

  group("GetStartingRoute use case unit test suite", () {
    test("when no routes have been visited, should return Routes.welcome",
        () async {
      when(mockCache.getValue(any))
          .thenAnswer((realInvocation) => Future.value(None()));

      final result = await getStartingRoute();

      expect(result, equals(Routes.welcome));
    });

    test(
        "when Routes.welcome has been visited, should return Routes.configuration",
        () async {
      when(mockCache.getValue(any)).thenAnswer((realInvocation) =>
          Future.value(Some(json.encode([Routes.welcome]))));

      final result = await getStartingRoute();

      expect(result, equals(Routes.configuration));
    });

    test(
        "when Routes.configuration has been visited, should return Routes.information",
        () async {
      when(mockCache.getValue(any)).thenAnswer((realInvocation) => Future.value(
          Some(json.encode([Routes.welcome, Routes.configuration]))));

      final result = await getStartingRoute();

      expect(result, equals(Routes.information));
    });

    test(
        "when Routes.information has been visited, should return Routes.discord",
        () async {
      when(mockCache.getValue(any)).thenAnswer((realInvocation) => Future.value(
          Some(json.encode(
              [Routes.welcome, Routes.configuration, Routes.information]))));

      final result = await getStartingRoute();

      expect(result, equals(Routes.discord));
    });

    test("when Routes.discord has been visited, should return Routes.home",
        () async {
      when(mockCache.getValue(any)).thenAnswer((realInvocation) => Future.value(
              Some(json.encode([
            Routes.welcome,
            Routes.configuration,
            Routes.information,
            Routes.discord
          ]))));

      final result = await getStartingRoute();

      expect(result, equals(Routes.home));
    });
  });
}
