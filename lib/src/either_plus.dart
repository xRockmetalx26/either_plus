import 'package:either_plus/src/app_error.dart';

/// Represents a value of one of two possible types.
/// Instances of [Either] are either an instance of [Error] or [Value].
///
/// [Error] is used for "error".
/// [Value] is used for "value".
sealed class Either<E extends AppError, V> {
  const Either();

  /// Represents the left side of [Either] class which by convention is a "Error".
  bool get isError => this is Error<E, V>;

  /// Represents the right side of [Either] class which by convention is a "Value"
  bool get isValue => this is Value<E, V>;

  /// Get [Error] value, may throw an exception when the value is [Value]
  E get error => this.fold<E>(
        (e) => e,
        (v) => throw Exception(
            'Illegal use. You should check hasError before calling'),
      );

  /// Get [Value] value, may throw an exception when the value is [Error]
  V get value => this.fold<V>(
        (e) => throw Exception(
            'Illegal use. You should check hasValue before calling'),
        (v) => v,
      );

  /// Fold [Error] and [Value] into the value of one type
  T fold<T>(
    T Function(E error) fnE,
    T Function(V value) fnV,
  );

  @override
  bool operator ==(Object obj) => this.fold(
        (e) => obj is Error && e == obj.value,
        (v) => obj is Value && v == obj.value,
      );

  @override
  int get hashCode => fold(
        (e) => e.hashCode,
        (v) => v.hashCode,
      );
}

/// Used for "error"
final class Error<E extends AppError, V> extends Either<E, V> {
  const Error(this._v);

  final E _v;

  @override
  String toString() => error.toString();

  @override
  T fold<T>(
    T Function(E error) fnE,
    T Function(V value) fnV,
  ) =>
      fnE(_v);
}

/// Used for "value"
final class Value<E extends AppError, V> extends Either<E, V> {
  const Value(this._v);

  final V _v;

  @override
  String toString() => value.toString();

  @override
  T fold<T>(
    T Function(E error) fnE,
    T Function(V value) fnV,
  ) =>
      fnV(_v);
}
