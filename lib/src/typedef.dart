import 'package:either_plus/src/either_plus.dart';
import 'package:either_plus/src/app_error.dart';

/// Json format
typedef Json = Map<String, dynamic>;

/// Either of Failure or T
typedef EValue<T> = Either<AppError, T>;

/// Future of Either of Failure or T
typedef FEValue<T> = Future<EValue<T>>;

/// Either of Failure or List of T
typedef EList<T> = Either<AppError, List<T>>;

/// Future of Either of Failure or List of T
typedef FEList<T> = Future<EList<T>>;
