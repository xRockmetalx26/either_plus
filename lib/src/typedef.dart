import 'dart:async';
import 'package:either_plus/src/either.dart';
import 'package:either_plus/src/errors.dart';

/// Either of Error or T
typedef EValue<T> = Either<EitherError, T>;

/// Future of Either of Error or T
typedef FEValue<T> = Future<EValue<T>>;

/// Either of Error or List of T
typedef EList<T> = Either<EitherError, List<T>>;

/// Future of Either of Error or List of T
typedef FEList<T> = Future<EList<T>>;

/// Either of Error or Json
typedef EJson<T> = Either<EitherError, Map<String, T>>;

/// Future of Either of Error or Json
typedef FEJson<T> = Future<EJson<T>>;
