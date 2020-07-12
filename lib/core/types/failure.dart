import 'package:flutter/cupertino.dart';

abstract class Failure {
  final String reason;
  final Exception exception;

  Failure({@required this.reason, this.exception});
}
