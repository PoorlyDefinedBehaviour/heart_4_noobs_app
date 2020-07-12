import 'package:dartz/dartz.dart';
import "../core/types/failure.dart";

abstract class Cache {
  Future<Either<Failure, Unit>> set(final String key, final String value);
  Future<Option<String>> get(final String key);
}
