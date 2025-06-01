import 'package:equatable/equatable.dart';

abstract class EitherError extends Equatable {
  const EitherError(
    this.message, [
    this.code,
  ]);

  final String message;
  final int? code;

  String get description =>
      '$message${code is int ? ' (${code! + 2000})' : ''}';

  @override
  List<Object?> get props => [
        message,
        code,
      ];
}
