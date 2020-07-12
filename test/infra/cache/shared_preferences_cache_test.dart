import 'package:dartz/dartz.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:heart_4_noobs/infra/cache/shared_preferences/shared_preferences_cache.dart';
import 'package:heart_4_noobs/locator.dart';
import "package:mockito/mockito.dart";
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  final mockSharedPreferences = MockSharedPreferences();

  locator.registerSingleton<SharedPreferences>(mockSharedPreferences);

  final sharedPreferencesCache = SharedPreferencesCache();

  group("SharedPreferencesCache unit test suite", () {
    group("getValue", () {
      test("when key is not in the cache, should return None", () async {
        when(mockSharedPreferences.getString(any))
            .thenAnswer((realInvocation) => null);

        final result =
            await sharedPreferencesCache.getValue("some_key_not_in_the_cache");

        expect(result, equals(None()));
      });

      test("when key is in the cache, should return Some(value)", () async {
        final expectedValue = "hello world";

        when(mockSharedPreferences.getString(any))
            .thenAnswer((realInvocation) => expectedValue);

        final result =
            await sharedPreferencesCache.getValue("some_key_not_in_the_cache");

        expect(result, equals(Some(expectedValue)));
      });
    });

    group("setValue", () {
      test(
          "when value cant be cached should return Left(SharedPreferencesCacheFailure(...))",
          () async {
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((realInvocation) => Future.value(false));

        final result =
            await sharedPreferencesCache.setValue("some_key", "some_value");

        expect(
            result,
            equals(Left(SharedPreferencesCacheFailure(
                reason: "failed to set some_key"))));
      });

      test("when value can be cached should return Right(unit)", () async {
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((realInvocation) => Future.value(true));

        final result =
            await sharedPreferencesCache.setValue("some_key", "some_value");

        expect(result, equals(Right(unit)));
      });
    });
  });
}
