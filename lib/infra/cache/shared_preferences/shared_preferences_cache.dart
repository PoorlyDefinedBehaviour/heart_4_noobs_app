import 'package:flutter/cupertino.dart';
import 'package:heart_4_noobs/core/types/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:heart_4_noobs/domain/cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCacheFailure extends Failure {
  SharedPreferencesCacheFailure({
    @required String reason,
    Exception exception,
  }) : super(reason: reason, exception: exception);
}

class SharedPreferencesCache implements Cache {
  Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  @override
  Future<Option<String>> get(String key) async {
    final value =
        await _sharedPreferences.then((instance) => instance.getString(key));
    return value == null ? None() : Some(value);
  }

  @override
  Future<Either<Failure, Unit>> set(
      final String key, final String value) async {
    final success = await _sharedPreferences
        .then((instance) => instance.setString(key, value));
    return success
        ? Right(unit)
        : Left(SharedPreferencesCacheFailure(reason: "failed to set $key"));
  }
}
