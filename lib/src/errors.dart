import 'package:equatable/equatable.dart';

abstract class EitherError extends Equatable {
  const EitherError(
    this.message, {
    this.details,
    this.code,
    this.exception,
  });

  final String message;
  final String? details;
  final int? code;
  final dynamic exception;

  String get description =>
      '$message${code is int ? ' (${code! + 2000})' : ''}';

  @override
  List<Object?> get props => [
        message,
        details,
        code,
        exception,
      ];
}
