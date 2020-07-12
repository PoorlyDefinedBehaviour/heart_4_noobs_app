import 'package:dartz/dartz.dart';
import 'package:heart_4_noobs/core/types/failure.dart';

abstract class Cache {
  Future<Either<Failure, Unit>> setValue(final String key, final String value);
  Future<Option<String>> getValue(final String key);
}
