import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  const AppError(
    this.message, [
    this.code,
  ]);

  static const defaultCode = null;

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
