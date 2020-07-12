import 'package:flutter/cupertino.dart';
import 'package:heart_4_noobs/core/types/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:heart_4_noobs/domain/cache.dart';
import 'package:heart_4_noobs/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCacheFailure extends Failure {
  SharedPreferencesCacheFailure({
    @required String reason,
    Exception exception,
  }) : super(reason: reason, exception: exception);
}

class SharedPreferencesCache implements Cache {
  SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  @override
  Future<Option<String>> getValue(String key) async {
    final value = _sharedPreferences.getString(key);
    return value == null ? None() : Some(value);
  }

  @override
  Future<Either<Failure, Unit>> setValue(
      final String key, final String value) async {
    final success = await _sharedPreferences.setString(key, value);
    return success
        ? Right(unit)
        : Left(SharedPreferencesCacheFailure(reason: "failed to set $key"));
  }
}
