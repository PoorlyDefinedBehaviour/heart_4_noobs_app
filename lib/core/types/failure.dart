import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Failure extends Equatable {
  final String reason;
  final Exception exception;

  @override
  List<Object> get props => [reason, exception];

  Failure({@required this.reason, this.exception});
}
